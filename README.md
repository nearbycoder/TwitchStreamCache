# Twitch Streamer Live Data Caching Application

App will cache Twitch stream response for a user ever 10 seconds to prevent throttling from twitch.

## Installation

- Create `.env` file from `sample.env`
- Update environment variables
- Run `source .env` to source the environment variables
- Run `mix deps.get`
- Run `iex -S mix` to launch the service
- Go to `http://127.0.0.1:8080/twitch/:twitch_user_id` in your browser



