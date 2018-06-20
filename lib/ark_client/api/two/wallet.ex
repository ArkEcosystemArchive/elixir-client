defmodule ArkClient.API.Two.Account do
  @moduledoc """
  Documentation for ArkClient.API.One.Account.
  """

  import ArkClient

  @spec list(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("wallets", parameters)
  end

  @spec top(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def top(client, parameters \\ []) do
    client |> get("wallets/top", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("wallets/#{id}")
  end

  @spec transactions(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def transactions(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions", parameters)
  end

  @spec sent_transactions(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def sent_transactions(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions/sent", parameters)
  end

  @spec received_transaction(Tesla.Client.t(), String.t(), List.t()) :: ArkClient.response()
  def received_transaction(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions/received", parameters)
  end

  @spec votes(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def votes(client, id) do
    client |> get("wallets/#{id}/votes")
  end

  @spec search(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def search(client, parameters) do
    client |> post("wallets/search", parameters)
  end
end
