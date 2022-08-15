defmodule GetawaysWeb.Resolvers.Accounts do
  alias GetawaysWeb.Schema.ChangesetErrors

  def users(_, _, _) do
    {:ok, Getaways.Accounts.list_users()}
  end

  def user(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def user(_, _, _) do
    {:ok, nil}
  end

  def signup(_, args, _) do
    case Getaways.Accounts.create_user(args) do
      {:ok, user} ->
        token = GetawaysWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}

      {:error, changeset} ->
        {:error,
         message: "Could not create booking", details: ChangesetErrors.error_details(changeset)}
    end
  end

  def signin(_, %{username: username, password: password}, _) do
    case Getaways.Accounts.authenticate(username, password) do
      {:ok, user} ->
        token = GetawaysWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}

      :error ->
        {:error, "Woops, Invaild credentials"}
    end
  end
end
