defmodule ArkEcosystem.Client.API.Peers do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Peers
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("peers", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, ip) do
    client |> get("peers/#{ip}")
  end
end
