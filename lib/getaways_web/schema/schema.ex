defmodule GetawaysWeb.Schema.Schema do
  use Absinthe.Schema

  alias GetawaysWeb.Resolvers
  alias Getaways.{Vacation, Accounts}
  import_types(Absinthe.Type.Custom)
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  query do
    @desc "Get a place by its slug"
    field :place, :place do
      arg(:slug, non_null(:string))

      resolve(&Resolvers.Vacation.place/3)
    end

    @desc "Get a list place"
    field :places, list_of(:place) do
      resolve(&Resolvers.Vacation.places/3)
    end
  end

  object :place do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :location, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :price_per_night, non_null(:decimal)
    field :image, non_null(:string)
    field :image_thumbnail, non_null(:string)
    field :max_guests, non_null(:integer)
    field :pet_friendly, non_null(:boolean)
    field :pool, non_null(:boolean)
    field :wifi, non_null(:boolean)

    field :bookings, list_of(:booking) do
      arg(:limit, type: :integer, default_value: 100)
      resolve(dataloader(Vacation, :bookings, args: %{scope: :place}))
    end

    field :reviews, list_of(:review), resolve: dataloader(Vacation)
  end

  object :booking do
    field :id, non_null(:id)
    field :end_date, non_null(:date)
    field :start_date, non_null(:date)
    field :state, non_null(:string)
    field :total_price, non_null(:decimal)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :place, non_null(:place), resolve: dataloader(Vacation)
  end

  object :review do
    field :id, non_null(:id)
    field :comment, non_null(:string)
    field :rating, non_null(:integer)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :place, non_null(:place), resolve: dataloader(Vacation)
  end

  object :user do
    field :email, non_null(:string)
    field :username, non_null(:string)
    field :bookings, list_of(:booking), resolve: dataloader(Vacation)
    field :reviews, list_of(:review), resolve: dataloader(Vacation)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Vacation, Vacation.datasource())
      |> Dataloader.add_source(Accounts, Accounts.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
