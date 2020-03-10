defmodule Nookinc.Commands.FriendCode do
  alias Nookinc.Models.FriendCode
  alias Nostrum.Struct.User

  @error_uwu "uh oh, we made a fucky wucky uwu"

  def lookup(%User{id: user_id}) do
    user_id
    |> FriendCode.find()
    |> friend_code_message
  end

  @spec lookup([] | Nostrum.Struct.User.t()) :: any()
  def lookup(users) when is_list(users) do
    users
    |> Enum.map(fn user -> user.id end)
    |> FriendCode.find()
    |> case do
      {:ok, [_ | _] = friend_codes} ->
        friend_codes
        |> Enum.map(&friend_code_message/1)
        |> Enum.reduce(&"#{&2}\n#{&1}")

      {:ok, %FriendCode{} = friend_code} ->
        friend_code_message(friend_code)

      {:ok, []} ->
        friend_code_message([])

      {:error, _} ->
        @error_uwu
    end
  end

  defp friend_code_message(%FriendCode{user_id: user_id, switch: switch}) when is_nil(switch) do
    "#{user_id} has not set a friend code yet"
  end

  defp friend_code_message(%FriendCode{user_id: user_id, switch: switch}) do
    "#{user_id}'s friend code is: #{switch}"
  end

  defp friend_code_message([]), do: "None of those users have set a friend code yet."
  defp friend_code_message(_), do: @error_uwu

  def add(user_id, friend_code) do
    user_id
    |> FriendCode.find()
    |> FriendCode.changeset(%{user_id: user_id, switch: friend_code})
    |> FriendCode.create()
    |> case do
      {:ok, _} ->
        "Successfully saved friend code"

      {:error, _} ->
        @error_uwu
    end
  end
end
