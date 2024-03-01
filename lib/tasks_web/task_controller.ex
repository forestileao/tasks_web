defmodule TasksWeb.TaskController do
  use Plug.Builder
  import Plug.Conn
  alias TasksWeb.Tasks
  alias TasksWeb.View.TaskView

  def call(conn, action: action) do
    conn = super(conn, [])
    apply(__MODULE__, action, [conn, conn.params])
  end

  def index(conn, _params) do
    tasks = Tasks.list()
    conn
    |> put_status(200)
    |> render("tasks.xhtml.eex", tasks: tasks)
  end

  defp render(conn, file, assigns) do
    TaskView.render(conn, file, assigns)
  end
end
