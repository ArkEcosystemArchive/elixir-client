defmodule ArkClient.API.Two.Transaction do
  @moduledoc """
  Documentation for ArkClient.API.One.Transaction.
  """

  import ArkClient

  @spec list(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("transactions", parameters)
  end

  @spec create(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def create(client, parameters) do
    client |> post("transactions", %{transactions: transactions})
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("transactions/#{id}")
  end

  @spec list_unconfirmed(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list_unconfirmed(client, parameters \\ []) do
    client |> get("transactions/unconfirmed", parameters)
  end

  @spec get_unconfirmed(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def get_unconfirmed(client, id) do
    client |> get("transactions/unconfirmed/#{id}")
  end

  @spec search(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def search(client, parameters) do
    client |> post("transactions/search", parameters)
  end

  @spec types(Tesla.Client.t()) :: ArkClient.response()
  def types(client) do
    client |> get("transactions/types")
  end
end
