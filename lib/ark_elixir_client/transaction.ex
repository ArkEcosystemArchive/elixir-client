defmodule ArkElixirClient.Transaction do
  @moduledoc """
  Documentation for ArkElixirClient.Transaction.
  """

  import ArkElixir

  alias ArkElixirClient.Models.Transaction
  alias ArkElixirClient.Util.TransactionBuilder

  @doc """
  Sign and create a new transaction.

  ## Examples

      iex> ArkElixirClient.Transaction.create(client, "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc", 100000000, "can't sleep! clowns will eat me!", "meniscus drive despoil music poplin prolong landau huarache govern hotbox")
      {:ok,
       %{
         "success" => true,
         "transactionIds" => ["4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56"]
       }}
  """
  @spec create(
    Tesla.Client.t(),
    String.t(),
    String.t(),
    String.t(),
    String.t(),
    String.t()
  ) :: ArkElixirClient.response()
  def create(
    client,
    recipient_id,
    amount,
    vendor_field,
    secret,
    second_secret \\ nil
  ) do
    transaction =
      recipient_id
      |> TransactionBuilder.create_transfer(
        amount,
        vendor_field,
        secret,
        second_secret
      )
      |> TransactionBuilder.transaction_to_params

    post(client, "peer/transactions", %{transactions: [transaction]})
  end

  @doc """
  Create a new transaction.

  ## Examples

      iex> ArkElixirClient.Transaction.create_from_signed_object(client, transaction)
      {:ok,
       %{
         "success" => true,
         "transactionIds" => ["4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56"]
       }}
  """
  @spec create_from_signed_object(
    Tesla.Client.t(),
    Keyword.t()
  ) :: ArkElixirClient.response()
  def create_from_signed_object(client, transaction) do
    post(client, "peer/transactions", %{transactions: [transaction]})
  end

  @doc """
  Get a single transaction.

  ## Examples

      iex> ArkElixirClient.Transaction.transaction(client, "4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56")
      {:ok,
       %ArkElixirClient.Models.Transaction{
         amount: 100000000,
         asset: nil,
         blockid: "5375521981080787257",
         confirmations: 68,
         fee: 10000000,
         height: 3102528,
         id: "4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56",
         recipient_id: "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc",
         sender_id: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
         sender_public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
         timestamp: 33485620,
         type: 0,
         vendor_field: "can't sleep! clowns will eat me!"
       }}
  """
  @spec transaction(Tesla.Client.t(), Keyword.t()) :: ArkElixirClient.response()
  def transaction(client, id) do
    client
    |> get("api/transactions/get", query: [id: id])
    |> handle_response
  end

  @doc """
  Get all transactions.

  ## Examples

      iex> ArkElixirClient.Transaction.transactions(client)
      {:ok,
       [
         %ArkElixirClient.Models.Transaction{
           amount: 1105,
           asset: %{},
           blockid: "10000164854398237004",
           confirmations: 882590,
           fee: 10000000,
           height: nil,
           id: "21e76d0794475a8161a74a716311eff95e55819d998407f79778c3fbe9941ba2",
           recipient_id: "D7pcLJNGe197ibmWEmT8mM9KKU1htrcDyW",
           sender_id: "DB8LnnQqYvHpG4WkGJ9AJWBYEct7G3yRZg",
           sender_public_key: "0265c1f6b8c1966a90f3fed7bc32fd4f42238ab4938fdb2a4e7ddd01ae8b58b4c0",
           timestamp: 24501672,
           type: 0,
           vendor_field: "Goose Voter - True Block Weight"
         },
         %ArkElixirClient.Models.Transaction{amount: 52, asset: nil, ...},
         %ArkElixirClient.Models.Transaction{amount: 57, ...},
         %ArkElixirClient.Models.Transaction{...},
         ...
       ]}
  """
  @spec transactions(Tesla.Client.t(), Keyword.t()) :: ArkElixirClient.response()
  def transactions(client, parameters \\ []) do
    client
    |> get("api/transactions", query: parameters)
    |> handle_response
  end

  @doc """
  Get a single unconfirmed transaction.

  ## Examples

      iex> ArkElixirClient.Transaction.unconfirmed_transaction(client, "5a4f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d45")
      {:ok,
       %ArkElixirClient.Models.Transaction{
         amount: 100000000,
         asset: nil,
         blockid: nil,
         confirmations: 0,
         fee: 10000000,
         height: 3102528,
         id: "4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56",
         recipient_id: "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc",
         sender_id: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
         sender_public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
         timestamp: 33485620,
         type: 0,
         vendor_field: "I’d rather let 1000 guilty men go free than chase after them."
       }}
  """
  @spec unconfirmed_transaction(
    Tesla.Client.t(),
    String.t()
  ) :: ArkElixirClient.response()
  def unconfirmed_transaction(client, id) do
    client
    |> get("api/transactions/unconfirmed/get", query: [id: id])
    |> handle_response
  end

  @doc """
  Get all unconfirmed transactions.

  ## Examples

      iex> ArkElixirClient.Transaction.unconfirmed_transactions(client)
      {:ok, []}
  """
  @spec unconfirmed_transactions(
    Tesla.Client.t(),
    Keyword.t()
  ) :: ArkElixirClient.response()
  def unconfirmed_transactions(client, parameters \\ []) do
    client
    |> get("api/transactions/unconfirmed", query: parameters)
    |> handle_response
  end

  # private

  defp handle_response({:ok, %{"transactions" => transactions}}) do
    {:ok, Enum.map(transactions, &Transaction.build/1)}
  end

  defp handle_response({:ok, %{"transaction" => transaction}}) do
    {:ok, Transaction.build(transaction)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
