FROM elixir:1.15.7-alpine as build

# install build dependencies for BUILD server
RUN apk add --update git build-base npm bash openssl ncurses-libs postgresql-client

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force


# set build ENV
ENV MIX_ENV=prod

# copy source
COPY mix.exs mix.lock ./
COPY apps apps
COPY config config
 
# install mix dependencies
RUN mix deps.get

# build project
RUN mix compile

# build release (uncomment COPY if rel/ exists)
# COPY rel rel
RUN mix release

COPY run_app.sh .

# Run the Phoenix app
CMD ["./run_app.sh"]