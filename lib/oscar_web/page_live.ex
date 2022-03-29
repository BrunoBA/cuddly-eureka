defmodule OscarWeb.PageLive do
  use OscarWeb, :live_view

  def render(assigns) do
    Phoenix.View.render(OscarWeb.PageView, "page.html", assigns)
  end

  def mount(params, data, socket) do
    options = [
      %{
        value: 1,
        class: "bg-red-500 h-10 w-10 m-1"
      },
      %{
        value: 2,
        class: "bg-lime-500 h-10 w-10 m-1"
      },
      %{
        value: 3,
        class: "bg-sky-500 h-10 w-10 m-1"
      }
    ]

    unless Map.has_key?(data, "user_id") do
      {:ok, redirect(socket, to: Routes.login_path(socket, :index))}
    else
      temperature = 0

      socket =
        socket
        |> assign(:temperature, temperature)
        |> assign(:choosen_option, "1")
        |> assign(:options, options)

      {:ok, socket}
    end
  end

  def handle_event("square", value, socket) do
    %{"square_id" => square_id} = value

    socket =
      socket
      |> assign(:choosen_option, square_id)

    {:noreply, socket}
  end

  def handle_event("inc_temperature", value, socket) do
    temperature = socket.assigns[:temperature]
    new_temp = temperature + 1
    IO.inspect(value)
    IO.puts("---------------")

    {:noreply, assign(socket, :temperature, new_temp)}
  end
end
