defmodule ArkEcosystem.Client.API.Node do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Node
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

  @spec crypto(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def crypto(client) do
    client |> get("node/configuration/crypto")
  end

  @spec fees(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def fees(client, parameters \\ [days: nil]) do
    client |> get("node/fees", parameters)
  end
end
