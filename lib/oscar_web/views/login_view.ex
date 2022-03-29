defmodule OscarWeb.LoginView do
  use OscarWeb, :view

  def auth_google(link) do
    render("google_auth.html", link: link)
  end
end
