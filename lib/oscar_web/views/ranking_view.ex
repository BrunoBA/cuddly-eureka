defmodule OscarWeb.RankingView do
  use OscarWeb, :view

	def hide_email(email) do
		email_without_domain = Regex.replace(~r/@([a-zA-Z0-9_\-\.]+)\.([a-zA-z]+)$/u, email, "")
		email_without_last_characters = String.slice(email_without_domain, 0..-4)
		email_without_last_characters <> "..."
	end
end
