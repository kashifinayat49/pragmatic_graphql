# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Getaways.Repo.insert!(%Getaways.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Getaways.Repo
alias Getaways.Accounts.User
alias Getaways.Vacation.{Booking, Place, Review}

mike =
  %User{}
  |> User.changeset(%{
    username: "username",
    email: "email@example.com",
    password: "secret"
  })
  |> Repo.insert!()

%User{}
|> User.changeset(%{
  username: "username1",
  email: "email1@example.com",
  password: "secret"
})
|> Repo.insert!()

%User{}
|> User.changeset(%{
  username: "username2",
  email: "email2@example.com",
  password: "secret"
})
|> Repo.insert!()

%Place{
  description: "description",
  image: "image",
  image_thumbnail: "image_thumbnail",
  location: "location",
  max_guests: 4,
  name: "name",
  pet_friendly: true,
  pool: true,
  price_per_night: Decimal.from_float(126.00),
  slug: "slug",
  wifi: true,
  bookings: [
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      total_price: Decimal.from_float(555.00),
      user: mike
    }
  ],
  reviews: [
    %Review{
      comment: "comment",
      rating: 5,
      user: mike
    }
  ]
}
|> Repo.insert!()
