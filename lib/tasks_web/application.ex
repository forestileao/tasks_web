defmodule TasksWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {TasksWeb.Tasks, []},
      {
        Plug.Pedro.HttpServer, [
        plug: TasksWeb.Router,
        port: 4040,
        options: []
      ]}
    ]

    opts = [strategy: :one_for_one, name: TasksWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
