defmodule TwitchFetch do
  use HTTPoison.Base

  def fetch_streamer_info(twitch_id) do
    Task.async(fn -> handle_request("https://api.twitch.tv/helix/streams/?user_id=#{twitch_id}") end)
    |> Task.await
  end

  defp handle_request(url) do
    twitch_client_id = Application.get_env(:twitch, Twitch)[:twitch_client_id]

    case HTTPoison.get(url, ["Client-ID": twitch_client_id, "Accept": "application/vnd.twitchtv.v5+json"]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end