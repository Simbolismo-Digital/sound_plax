defmodule SoundPlaxWeb.RoomChannel do
  use Phoenix.Channel

  require Logger

  def join("room:lobby", _message, socket) do
    Logger.warning("A socket has joinned #{inspect(socket)}")
    {:ok, socket}
  end

  # def join("room:" <> _private_room_id, _params, _socket) do
  #   {:error, %{reason: "unauthorized"}}
  # end

  def handle_in("send_audio_data", %{"user" => user, "body" => body}, socket) do
    Logger.warning("Broadcasting")
    broadcast!(socket, "room:lobby:broadcast_audio_data", %{user: user, body: body})
    {:noreply, socket}
  end
end
