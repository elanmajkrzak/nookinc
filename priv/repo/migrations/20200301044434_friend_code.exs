defmodule Nookinc.Repo.Migrations.FriendCode do
  use Ecto.Migration

  def change do
    create table(:friend_codes) do
      add :user_id, :string
      add :switch, :string
    end
  end
end
