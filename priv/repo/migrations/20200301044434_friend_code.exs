defmodule Nookinc.Repo.Migrations.FriendCode do
  use Ecto.Migration

  def change do
    create table(:friend_codes) do
      add :user_id, :bigint
      add :switch, :string
    end

    create unique_index(:friend_codes, [:user_id])
  end
end
