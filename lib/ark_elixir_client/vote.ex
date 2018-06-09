defmodule ArkElixirClient.Vote do
  @moduledoc """
  Documentation for ArkElixirClient.Vote.
  """

  import ArkElixir

  @doc """
  Sign and create a new vote.

  ## Examples

      iex> ArkElixirClient.Vote.vote(client)
      :world

  """
  @spec vote(ArkElixirClient.Client, String.t(), String.t(), String.t()) :: ArkElixirClient.response()
  def vote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkElixirClient.Util.TransactionBuilder.create_vote(
        ["+" <> delegate],
        secret,
        second_secret,
        client.network_address
      ) |> ArkElixirClient.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Sign and create a new unvote.

  ## Examples

      iex> ArkElixirClient.Vote.unvote(client)
      :world

  """
  @spec unvote(ArkElixirClient.Client, String.t(), String.t(), String.t()) :: ArkElixirClient.response()
  def unvote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkElixirClient.Util.TransactionBuilder.create_vote(
        ["-" <> delegate],
        secret,
        second_secret,
        client.network_address
      ) |> ArkElixirClient.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
