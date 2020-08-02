defmodule Nookinc.Commands.DreamAddress do
  alias Nookinc.Models.FriendCode
  alias Nostrum.Struct.User

  @error_uwu "uh oh, we made a fucky wucky uwu"

  def lookup(%User{id: user_id}) do
    user_id
    |> FriendCode.find()
    |> dream_address_message
  end

  @spec lookup([] | Nostrum.Struct.User.t()) :: any()
  def lookup(users) when is_list(users) do
    users
    |> Enum.map(fn user -> user.id end)
    |> FriendCode.find()
    |> case do
         {:ok, [_ | _] = friend_codes} ->
           friend_codes
           |> Enum.map(&dream_address_message/1)
           |> Enum.reduce(&"#{&2}\n#{&1}")

         {:ok, %FriendCode{} = friend_code} ->
           dream_address_message(friend_code)

         {:ok, []} ->
           dream_address_message([])

         _ ->
           @error_uwu
       end
  end

  defp dream_address_message(%FriendCode{user_id: user_id, dream_address: dream_address}) when is_nil(dream_address) do
    user = %Nostrum.Struct.User{id: user_id}
    "#{user} has not set a dream address yet"
  end

  defp dream_address_message(%FriendCode{user_id: user_id, dream_address: dream_address}) do
    user = %Nostrum.Struct.User{id: user_id}
    "#{user}'s dream address is: #{dream_address}"
  end

  defp dream_address_message([]), do: "None of those users have set a dream address yet."
  defp dream_address_message(_), do: @error_uwu

  def add(user_id, dream_address) do
    user_id
    |> FriendCode.find()
    |> FriendCode.changeset(%{user_id: user_id, dream_address: dream_address})
    |> FriendCode.create()
    |> case do
         {:ok, _} ->
           "Successfully saved dream address"

         {:error, %__changeset__{valid?: false}} ->
           "Invalid dream address, it should be in the form DA-1234-1234-1234"

         {:error, _} ->
           @error_uwu
       end
  end
end
