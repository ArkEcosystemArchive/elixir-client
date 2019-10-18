defmodule ArkEcosystem.Client.API.Businesses do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Businesses
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("businesses", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("businesses/#{id}")
  end

  @spec bridgechains(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def bridgechains(client, id, parameters \\ []) do
    client |> get("businesses/#{id}/bridgechains", parameters)
  end

  @spec search(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    client |> post("businesses/search", parameters)
  end
end
