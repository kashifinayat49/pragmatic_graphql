defmodule GetawaysWeb.Resolvers.Vacation do
  alias Getaways.Vacation

  def place(_, %{slug: slug}, _) do
    {:ok, Vacation.get_place_by_slug!(slug)}
  end

  def places(_, _, _) do
    {:ok, Vacation.list_places()}
  end
end
