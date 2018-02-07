defmodule TwitchCrawler do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, {:noreply})
  end

  def init(queue) do
    handle_info(:work, queue)
    schedule_work()
    {:ok, queue}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 10000) # 10 seconds
  end

  def handle_info(:work, queue) do
    TwitchStatusStore.put(twitch_user_id(), streamer())
    schedule_work()
    {:noreply, queue}
  end

  defp streamer do
    TwitchFetch.fetch_streamer_info(twitch_user_id())
  end

  defp twitch_user_id do
    Application.get_env(:twitch, Twitch)[:twitch_user_id]
  end
end