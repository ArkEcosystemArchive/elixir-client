defmodule ArkClient.API.Two.Transaction do
  @moduledoc """
  Documentation for ArkClient.API.One.Transaction.
  """

  import ArkClient

  alias ArkClient.API.One.Models.Transaction

  @spec list(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    get(client, "transactions", parameters)
  end

  @spec create(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def create(client, parameters) do
    post(client, "transactions", %{transactions: transactions})
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    get(client, "transactions/#{id}")
  end

  @spec list_unconfirmed(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def list_unconfirmed(client, parameters \\ []) do
    get(client, "transactions/unconfirmed", parameters)
  end

  @spec get_unconfirmed(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def get_unconfirmed(client, id) do
    get(client, "transactions/unconfirmed/#{id}")
  end

  @spec search(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def search(client, parameters) do
    post(client, "transactions/search", parameters)
  end

  @spec types(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def types(client) do
    get(client, "transactions/types")
  end
end
