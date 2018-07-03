defmodule ArkEcosystem.Client.API.Two.Transaction do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Transaction
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("transactions", parameters)
  end

  @spec create(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def create(client, parameters) do
    client |> post("transactions", %{transactions: parameters})
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("transactions/#{id}")
  end

  @spec list_unconfirmed(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list_unconfirmed(client, parameters \\ []) do
    client |> get("transactions/unconfirmed", parameters)
  end

  @spec get_unconfirmed(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def get_unconfirmed(client, id) do
    client |> get("transactions/unconfirmed/#{id}")
  end

  @spec search(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    client |> post("transactions/search", parameters)
  end

  @spec types(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def types(client) do
    client |> get("transactions/types")
  end
end
