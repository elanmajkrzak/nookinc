defmodule Nookinc.Commands.FriendCode do
  alias Nostrum.Snowflake
  alias Nookinc.Models.FriendCode

  @spec find(Snowflake.t()) :: {:ok, binary()}
  def find(user_id) do
    {:ok, ""}
  end

  def create(user_id, friend_code) do
    %FriendCode{}
    |> FriendCode.changeset(%{user_id: user_id, switch: friend_code})
    |> FriendCode.create()
    |> case do
      {:ok, friend_code} ->
        ""
    end
  end
end
