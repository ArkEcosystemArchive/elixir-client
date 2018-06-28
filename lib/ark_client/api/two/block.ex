defmodule ArkEcosystem.Client.API.Two.Block do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Block.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("blocks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("blocks/#{id}")
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkEcosystem.Client.response()
  def transactions(client, id, parameters \\ []) do
    client |> get("blocks/#{id}/transactions", parameters)
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    post("blocks/search", parameters)
  end
end
