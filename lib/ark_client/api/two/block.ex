defmodule ArkClient.API.Two.Block do
  @moduledoc """
  Documentation for ArkClient.API.One.Block.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("blocks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("blocks/#{id}")
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def transactions(client, id, parameters \\ []) do
    client |> get("blocks/#{id}/transactions", parameters)
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def search(client, parameters) do
    post("blocks/search", parameters)
  end
end
