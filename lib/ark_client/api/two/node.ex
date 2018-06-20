defmodule ArkClient.API.Two.Loader do
  @moduledoc """
  Documentation for ArkClient.API.One.Loader.
  """

  import ArkClient

  @spec status(Tesla.Client.t()) :: ArkClient.response()
  def status(client) do
    client |> get("api/node/status")
  end

  @spec syncing(Tesla.Client.t()) :: ArkClient.response()
  def syncing(client) do
    client |> get("api/node/syncing")
  end

  @spec configuration(Tesla.Client.t()) :: ArkClient.response()
  def configuration(client) do
    client |> get("api/node/configuration")
  end
end
