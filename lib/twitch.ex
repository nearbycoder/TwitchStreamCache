defmodule Twitch do
  use Application
  
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(TwitchStatusStore, []),
      worker(TwitchCrawler, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Twitch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
