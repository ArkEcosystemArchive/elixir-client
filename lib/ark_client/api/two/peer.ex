defmodule ArkClient.API.Two.Peer do
  @moduledoc """
  Documentation for ArkClient.API.One.Peer.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("peers", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, ip) do
    client |> get("peers/#{ip}")
  end
end
