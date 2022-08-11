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

mike1 =
  %User{}
  |> User.changeset(%{
    username: "username1",
    email: "email1@example.com",
    password: "secret"
  })
  |> Repo.insert!()

mike2 =
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
      state: "canceled",
      total_price: Decimal.from_float(555.00),
      user: mike
    },
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      state: "reserved",
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

%Place{
  description: "description1",
  image: "image1",
  image_thumbnail: "image_thumbnail1",
  location: "location1",
  max_guests: 4,
  name: "name1",
  pet_friendly: true,
  pool: true,
  price_per_night: Decimal.from_float(126.00),
  slug: "slug1",
  wifi: true,
  bookings: [
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      total_price: Decimal.from_float(555.00),
      user: mike1
    },
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      total_price: Decimal.from_float(555.00),
      user: mike1
    }
  ],
  reviews: [
    %Review{
      comment: "comment1",
      rating: 5,
      user: mike1
    }
  ]
}
|> Repo.insert!()

%Place{
  description: "description2",
  image: "image2",
  image_thumbnail: "image_thumbnail2",
  location: "location2",
  max_guests: 4,
  name: "name2",
  pet_friendly: true,
  pool: true,
  price_per_night: Decimal.from_float(126.00),
  slug: "slug2",
  wifi: true,
  bookings: [
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      total_price: Decimal.from_float(555.00),
      user: mike2
    }
  ],
  reviews: [
    %Review{
      comment: "comment2",
      rating: 5,
      user: mike2
    }
  ]
}
|> Repo.insert!()

%Place{
  description: "description3",
  image: "image3",
  image_thumbnail: "image_thumbnail3",
  location: "location3",
  max_guests: 4,
  name: "name3",
  pet_friendly: true,
  pool: true,
  price_per_night: Decimal.from_float(126.00),
  slug: "slug3",
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
      comment: "comment3",
      rating: 5,
      user: mike
    }
  ]
}
|> Repo.insert!()

%Place{
  description: "description4",
  image: "image4",
  image_thumbnail: "image_thumbnail4",
  location: "location4",
  max_guests: 4,
  name: "name4",
  pet_friendly: true,
  pool: true,
  price_per_night: Decimal.from_float(126.00),
  slug: "slug4",
  wifi: true,
  bookings: [
    %Booking{
      start_date: ~D[2019-10-16],
      end_date: ~D[2019-10-22],
      total_price: Decimal.from_float(555.00),
      user: mike2
    }
  ],
  reviews: [
    %Review{
      comment: "comment4",
      rating: 5,
      user: mike2
    }
  ]
}
|> Repo.insert!()
