use rustler::{Env, Error as NifError, Term};
use serde_datatransform::{
    cbor_hex_to_map, json_to_map, map_to_cbor_hex, map_to_json, map_to_toml, map_to_yaml,
    toml_to_map, yaml_to_map,
};
use serde_rustler::{from_term, to_term};
use serde_value::Value;

mod atoms {
    rustler::rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler::rustler_export_nifs! {
    "Elixir.DataSerialize",
    [
        ("cbor_hex_to_map", 1, cbor_hex_to_map_),
        ("map_to_cbor_hex", 1, map_to_cbor_hex_),
        ("json_to_map", 1, json_to_map_),
        ("map_to_json", 1, map_to_json_),
        ("map_to_toml", 1, map_to_toml_),
        ("toml_to_map", 1, toml_to_map_),
        ("yaml_to_map", 1, yaml_to_map_),
        ("map_to_yaml", 1, map_to_yaml_),
    ],
    None
}

macro_rules! make_function {
    ($name:ident, $input_type:ty, $func:ident) => {
        fn $name<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, NifError> {
            let input: $input_type = from_term(args[0])?;
            let obj = $func(&input).map_err(|err| format!("{}", err));
            to_term(env, obj).map_err(|err| err.into())
        }
    };
}

make_function!(cbor_hex_to_map_, String, cbor_hex_to_map);
make_function!(map_to_cbor_hex_, Value, map_to_cbor_hex);
make_function!(json_to_map_, String, json_to_map);
make_function!(map_to_json_, Value, map_to_json);
make_function!(toml_to_map_, String, toml_to_map);
make_function!(map_to_toml_, Value, map_to_toml);
make_function!(yaml_to_map_, String, yaml_to_map);
make_function!(map_to_yaml_, Value, map_to_yaml);
