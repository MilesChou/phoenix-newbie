FROM elixir:1.9-alpine

# Initial Rebar, Hex, Phoenix
RUN set -xe && \
        mix local.hex --force && \
        mix local.rebar --force

ENV SECRET_KEY_BASE=LnUoNK7oFj2eMdZX8m5sA9+I6wWA0PydncCYz1mLvr8S68PQu5uWwgmGJUN7CJSh \
    PORT=4000 \
    MIX_ENV=prod

WORKDIR /usr/src/app
COPY mix.* ./
COPY config ./config

# Install dependencies
RUN set -xe && \
        mix deps.get --only prod && \
        mix compile

COPY . .

# Generate digest for static files
RUN set -xe && \
        mix compile && \
        mix phx.digest

EXPOSE 4000

CMD ["mix", "phx.server"]
