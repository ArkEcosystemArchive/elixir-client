defmodule ArkEcosystem.Client.API.Two.Node do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Loader
  """

  import ArkEcosystem.Client

  @spec status(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def status(client) do
    client |> get("node/status")
  end

  @spec syncing(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def syncing(client) do
    client |> get("node/syncing")
  end

  @spec configuration(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def configuration(client) do
    client |> get("node/configuration")
  end
end
