defmodule ArkClient.API.Two.Loader do
  @moduledoc """
  Documentation for ArkClient.API.One.Loader.
  """

  import ArkClient

  @spec status(Tesla.Client.t()) :: ArkClient.response()
  def status(client) do
    client |> get("node/status")
  end

  @spec syncing(Tesla.Client.t()) :: ArkClient.response()
  def syncing(client) do
    client |> get("node/syncing")
  end

  @spec configuration(Tesla.Client.t()) :: ArkClient.response()
  def configuration(client) do
    client |> get("node/configuration")
  end
end
