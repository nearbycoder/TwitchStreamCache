defmodule Twitch.API do
  use Maru.Router

  mount Twitch.Router

  rescue_from :all do
    conn
    |> put_status(404)
    |> json(%{status: "user doesn't exist in memory", data: []})
  end
end