defmodule Twitch.Router do
  use Maru.Router

  plug Corsica, origins: "*"

  namespace :twitch do
    params do
      optional :twitch_id, type: String
    end

    get ":twitch_id" do
      {:ok, data} = TwitchStatusStore.get("#{params[:twitch_id]}")
      
      conn
      |> json(%{status: "ok", data: data["data"]})
    end
  end
end