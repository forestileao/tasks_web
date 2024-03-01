defmodule TasksWeb.View.TaskView do
  def render(conn, file, assigns) do
    Pedro.View.render(__MODULE__, conn, file, assigns)
  end
end
