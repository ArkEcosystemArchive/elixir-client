defmodule ArkClient.API.Two.Delegate do
  @moduledoc """
  Documentation for ArkClient.API.One.Delegate.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("delegates", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("delegates/#{id}")
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def blocks(client, id, parameters \\ []) do
    client |> get("delegates/#{id}/blocks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def voters(client, id, parameters \\ []) do
    client |> get("delegates/#{id}/voters", parameters)
  end
end
