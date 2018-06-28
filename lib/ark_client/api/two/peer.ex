defmodule ArkEcosystem.Client.API.Two.Peer do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Peer.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("peers", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, ip) do
    client |> get("peers/#{ip}")
  end
end
