defmodule SoundPlaxWeb.AudioStreamLive do
  use SoundPlaxWeb, :live_view

  def mount(_assigns, _session, socket) do
    pid = inspect(self())
    {
      :ok,
      socket
      |> assign(pid: pid)
    }
  end
end
