defmodule ArkClient.Vote do
  @moduledoc """
  Documentation for ArkClient.Vote.
  """

  import ArkClient

  @doc """
  Sign and create a new vote.

  ## Examples

      iex> ArkClient.Vote.vote(client)
      :world

  """
  @spec vote(ArkClient.Client, String.t(), String.t(), String.t()) :: ArkClient.response()
  def vote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkClient.Util.TransactionBuilder.create_vote(
        ["+" <> delegate],
        secret,
        second_secret,
        client.network_address
      ) |> ArkClient.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Sign and create a new unvote.

  ## Examples

      iex> ArkClient.Vote.unvote(client)
      :world

  """
  @spec unvote(ArkClient.Client, String.t(), String.t(), String.t()) :: ArkClient.response()
  def unvote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkClient.Util.TransactionBuilder.create_vote(
        ["-" <> delegate],
        secret,
        second_secret,
        client.network_address
      ) |> ArkClient.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
