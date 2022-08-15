defmodule GetawaysWeb.Resolvers.Vacation do
  alias Getaways.Vacation
  alias GetawaysWeb.Schema.ChangesetErrors

  def place(_, %{slug: slug}, _) do
    {:ok, Vacation.get_place_by_slug!(slug)}
  end

  def places(_, _, _) do
    {:ok, Vacation.list_places()}
  end

  def create_booking(_, arg, %{context: %{current_user: user}}) do
    case Vacation.create_booking(user, arg) do
      {:ok, bookings} ->
        publish_booking_change(bookings)
        {:ok, bookings}

      {:error, changeset} ->
        {:error,
         message: "Could not create booking", details: ChangesetErrors.error_details(changeset)}
    end
  end

  def cancel_booking(_, arg, %{context: %{current_user: user}}) do
    booking = Vacation.get_booking!(arg[:booking_id])

    if booking.user_id == user.id do
      case(Vacation.cancel_booking(booking)) do
        {:error, changeset} ->
          {:error,
           message: "Could not cancel booking!", details: ChangesetErrors.error_details(changeset)}

        {:ok, booking} ->
          publish_booking_change(booking)
          {:ok, booking}
      end
    else
      {:error, "Hey thats not your booking"}
    end
  end

  def create_review(_, arg, %{context: %{current_user: user}}) do
    case Vacation.create_review(user, arg) do
      {:ok, review} ->
        {:ok, review}

      {:error, changeset} ->
        {:error,
         message: "Could not create review", details: ChangesetErrors.error_details(changeset)}
    end
  end

  defp publish_booking_change(booking) do
    Absinthe.Subscription.publish(
      GetawaysWeb.Endpoint,
      booking,
      booking_change: booking.place_id
    )
  end
end
