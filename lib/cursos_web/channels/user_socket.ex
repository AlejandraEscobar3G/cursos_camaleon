defmodule CursosWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "videos:*", CursosWeb.VideoChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
