defmodule Nookinc.Repo.Migrations.DreamAddress do
  use Ecto.Migration

  def change do
    alter table(:friend_codes) do
      add :dream_address, :string
    end
  end
end
