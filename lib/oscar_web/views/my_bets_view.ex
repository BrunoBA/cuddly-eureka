defmodule OscarWeb.MyBetsView do
  use OscarWeb, :view
  use Phoenix.Component

  def get_bet_name(_category_id, []), do: ""

  def get_bet_name(category_id, bets) do
    bet = Enum.find(bets, fn bet -> bet.category_id === category_id end)

    if bet === nil do
      nil
    else
      bet.nominee_title
    end
  end

  def get_subtitle_name(category_id, bets) do
    bet = Enum.find(bets, fn bet -> bet.category_id === category_id end)

    if bet === nil do
      nil
    else
      bet.nominee_sub_title
    end
  end

  def get_correct_bets(assigns) do
    categories_size = Enum.count(assigns[:bets])
    correct_bets_size = Enum.count(assigns[:correct_bets])

    if correct_bets_size == 0 do
      ~H"""
      <span class="select-none">
      &nbsp;
      </span>
      """
    else
      ~H"""
      <div class="w-full flex justify-center mb-6">
      		<span class="montserrat uppercase" style="font-family: 'futura book legacy','FuturaPT-Book',Futura,'Trebuchet MS',Arial,sans-serif">
      			Correct bets:
      		<%= correct_bets_size %>/<%= categories_size %>
      		</span>
      </div>
      """
    end
  end

  def incomplete_bet_warning(assigns) do
    ~H"""
    <%= if (@nominee_title === nil) do %>
    <span class="text-red-500">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    	<path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    </span>
    <% end %>
    """
  end

  def get_correct_feedback(assigns) do
    category_id = assigns[:category_id]

    if !Enum.member?(assigns[:choices], category_id) do
      ~H"""
      """
    else
      ~H"""
      <span class="text-green-500">
      	<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
      		<path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
      	</svg>
      </span>
      """
    end
  end
end
