FROM elixir:1.9-alpine

WORKDIR /usr/src/app
COPY . .

# Initial Rebar and Hex
RUN mix local.rebar --force
RUN mix local.hex --force

# Install dependencies
RUN mix deps.get --only prod

# Generate digest for static files
RUN mix phx.digest

ENV SECRET_KEY_BASE=LnUoNK7oFj2eMdZX8m5sA9+I6wWA0PydncCYz1mLvr8S68PQu5uWwgmGJUN7CJSh \
    PORT=4000 \
    MIX_ENV=prod

EXPOSE 4000

CMD ["mix", "phx.server"]
