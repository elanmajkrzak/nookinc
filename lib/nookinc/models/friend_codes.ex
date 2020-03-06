defmodule Nookinc.Models.FriendCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nookinc.Repo

  schema "friend_codes" do
    field :user_id, :string
    field :switch, :string
  end

    def changeset(friend_code, params \\ %{}) do
      friend_code
      |> cast(params, [:user_id, :switch])
      |> validate_required([:user_id, :switch])
    end

    def create(%__changeset__{valid?: true} = changeset) do
      changeset
      |> Repo.insert()
    end

    def create(%__changeset__{valid?: false} = changeset) do
      IO.inspect(changeset, label: "create false")
    end

    def create(_), do: IO.puts("default")
end
