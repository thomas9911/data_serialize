FROM elixir:1.9-alpine

RUN apk update \
    && mix local.rebar --force \
    && mix local.hex --force \

RUN apk add cargo
RUN mix do deps.get, deps.compile 
CMD iex -S mix
