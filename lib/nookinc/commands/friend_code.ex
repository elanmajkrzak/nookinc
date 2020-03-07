defmodule Nookinc.Commands.FriendCode do
  alias Nostrum.Snowflake
  alias Nookinc.Models.FriendCode

  @spec find(Snowflake.t()) :: {:ok, binary()}
  def find(user_id) do
    {:ok, ""}
  end

  def add(user_id, friend_code) do
    user_id
    |> FriendCode.find
    |> FriendCode.changeset(%{user_id: user_id, switch: friend_code})
    |> FriendCode.create()
    |> case do
      {:ok, _} ->
        "Successfully saved friend code"

      {:error, _} ->
        "uh oh, we made a fucky wucky uwu"
    end
  end
end
