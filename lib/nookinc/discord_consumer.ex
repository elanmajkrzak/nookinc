defmodule Nookinc.DiscordConsumer do
  use Nostrum.Consumer
  alias Nostrum.Api
  alias Nostrum.Struct.Message

  def start_link, do: Consumer.start_link(__MODULE__)

  def handle_event({:MESSAGE_CREATE, %Message{content: content} = msg, _ws_state}) do
    content
    |> String.split(" ")
    |> handle_command(msg)
  end

  def handle_event(_), do: :noop

  def handle_command([command], %Message{channel_id: channel_id}) do
    command
    |> case do
      "ping!" ->
        Api.create_message(channel_id, content: "Don't fucking @ me")
      # "!fc" ->

      _ ->
        :ok
    end
  end

  def handle_command([command], %Message{channel_id: channel_id}) do
    command
    |> case do
      "ping!" ->
        Api.create_message(channel_id, content: "Don't fucking @ me")
      _ ->
        :ok
    end
  end

  def handle_command(_), do: :noop
end
