defmodule ArkEcosystem.Client.API.Bridgechains do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Bridgechains
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("bridgechains", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("bridgechains/#{id}")
  end

  @spec search(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    client |> post("bridgechains/search", parameters)
  end
end
