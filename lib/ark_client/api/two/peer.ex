defmodule ArkClient.API.Two.Peer do
  @moduledoc """
  Documentation for ArkClient.API.One.Peer.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    get(client, "peers", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, ip) do
    get(client, "peers/#{ip}")
  end
end
