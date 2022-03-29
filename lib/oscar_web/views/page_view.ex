defmodule OscarWeb.PageView do
  use OscarWeb, :view

  def check_option(class, check_value, id) do
    IO.inspect(check_value)
    IO.inspect(id)
    IO.puts("-----------------------")

    if String.to_integer(check_value) == id do
      class <> " text-white"
    else
      class
    end
  end
end
