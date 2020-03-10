defmodule Nookinc.DiscordConsumer do
  use Nostrum.Consumer
  alias Nostrum.Api
  alias Nostrum.Struct.Message
  alias Nookinc.Commands.FriendCode, as: FriendCodeCommand

  def start_link, do: Consumer.start_link(__MODULE__)

  def handle_event(
        {:MESSAGE_CREATE, %Message{content: content, channel_id: channel_id} = msg, _ws_state}
      ) do
    content
    |> String.split(" ")
    |> handle_command(msg)
    |> respond(channel_id)
  end

  def handle_event(_), do: :noop

  @spec handle_command(nonempty_maybe_improper_list, Nostrum.Struct.Message.t()) ::
          :noreply | :ok | {:ok, any}
  def handle_command([command], %Message{} = message) do
    command
    |> String.downcase()
    |> case do
      "ping!" ->
        {:ok, "Don't fucking @ me"}

      "!fc" ->
        {:ok, FriendCodeCommand.lookup(message.author)}

      _ ->
        :ok
    end
  end

  def handle_command([command, arg | _], %Message{} = message) do
    command
    |> String.downcase()
    |> case do
      "!fc" ->
        {:ok, FriendCodeCommand.lookup(message.mentions)}

      "!fcadd" ->
        {:ok, FriendCodeCommand.add(message.author.id, arg)}

      _ ->
        :noreply
    end
  end

  def handle_command(_), do: :noreply

  def respond({:ok, msg}, channel_id), do: Api.create_message(channel_id, content: msg)
  def respond(_, _), do: :noop
end
