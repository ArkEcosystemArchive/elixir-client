defmodule ArkEcosystem.Client.API.Two.Delegate do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Delegate.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("delegates", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("delegates/#{id}")
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkEcosystem.Client.response()
  def blocks(client, id, parameters \\ []) do
    client |> get("delegates/#{id}/blocks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t(), List.t()) :: ArkEcosystem.Client.response()
  def voters(client, id, parameters \\ []) do
    client |> get("delegates/#{id}/voters", parameters)
  end
end
