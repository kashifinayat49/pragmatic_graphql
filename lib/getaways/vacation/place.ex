defmodule Getaways.Vacation.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :description, :string
    field :image, :string
    field :image_thumbnail, :string
    field :location, :string
    field :max_guests, :integer, default: 2
    field :name, :string
    field :pet_friendly, :boolean, default: false
    field :pool, :boolean, default: false
    field :price_per_night, :decimal
    field :slug, :string
    field :wifi, :boolean, default: false

    has_many :bookings, Getaways.Vacation.Booking
    has_many :reviews, Getaways.Vacation.Review

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [
      :name,
      :slug,
      :description,
      :location,
      :price_per_night,
      :image,
      :image_thumbnail,
      :max_guests,
      :pet_friendly,
      :pool,
      :wifi
    ])
    |> validate_required([
      :name,
      :slug,
      :description,
      :location,
      :price_per_night,
      :image,
      :image_thumbnail
    ])
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end
