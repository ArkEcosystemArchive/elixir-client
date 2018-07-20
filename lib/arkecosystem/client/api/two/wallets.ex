defmodule ArkEcosystem.Client.API.Two.Wallets do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Wallets
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("wallets", parameters)
  end

  @spec top(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def top(client, parameters \\ []) do
    client |> get("wallets/top", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("wallets/#{id}")
  end

  @spec transactions(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def transactions(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions", parameters)
  end

  @spec sent_transactions(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def sent_transactions(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions/sent", parameters)
  end

  @spec received_transactions(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def received_transactions(client, id, parameters \\ []) do
    client |> get("wallets/#{id}/transactions/received", parameters)
  end

  @spec votes(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def votes(client, id) do
    client |> get("wallets/#{id}/votes")
  end

  @spec search(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    client |> post("wallets/search", parameters)
  end
end
