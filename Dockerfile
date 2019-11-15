FROM elixir:1.9-alpine

RUN apk update \
    && mix local.rebar --force \
    && mix local.hex --force

RUN apk add cargo

WORKDIR /usr/src/data

COPY . .

RUN mix do deps.get, deps.compile, compile, test 
CMD iex -S mix
