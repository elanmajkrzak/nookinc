defmodule Nookinc.Models.FriendCode do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Nookinc.Repo

  schema "friend_codes" do
    field(:user_id, :integer)
    field(:switch, :string)
  end

  def changeset(friend_code, params \\ %{}) do
    friend_code
    |> cast(params, [:user_id, :switch])
    |> validate_required([:user_id, :switch])
    |> unique_constraint(:user_id)
  end

  def find(user_id) when is_integer(user_id) do
    Nookinc.Models.FriendCode
    |> Repo.get_by(user_id: user_id)
    |> case do
      nil ->
        %__MODULE__{user_id: user_id}

      friend_code ->
        friend_code
    end
  end

  def find([_ | _] = user_ids) do
    Nookinc.Models.FriendCode
    |> where([fc], fc.user_id in ^user_ids)
    |> Repo.all()
    |> case do
      [_ | _] = friend_codes ->
        {:ok, friend_codes}

      [] ->
        {:ok, []}

      _ ->
        :error
    end
  end

  def find(_), do: :todo

  def create(%__changeset__{valid?: true} = changeset) do
    changeset
    |> Repo.insert_or_update()
  end

  def create(%__changeset__{valid?: false} = changeset) do
    IO.inspect(changeset, label: "create false")
  end

  def create(changeset), do: IO.puts(changeset, label: "default")
end
