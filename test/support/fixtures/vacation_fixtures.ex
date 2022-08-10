defmodule Getaways.VacationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Getaways.Vacation` context.
  """

  @doc """
  Generate a place.
  """
  def place_fixture(attrs \\ %{}) do
    {:ok, place} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        image_thumbnail: "some image_thumbnail",
        location: "some location",
        max_guests: 42,
        name: "some name",
        pet_friendly: true,
        pool: true,
        price_per_night: "120.5",
        slug: "some slug",
        wifi: true
      })
      |> Getaways.Vacation.create_place()

    place
  end

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{
        end_date: ~D[2022-08-09],
        start_date: ~D[2022-08-09],
        state: "some state",
        total_price: "120.5"
      })
      |> Getaways.Vacation.create_booking()

    booking
  end

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        rating: 42
      })
      |> Getaways.Vacation.create_review()

    review
  end
end
