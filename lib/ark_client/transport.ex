defmodule ArkClient.Transport do
  @moduledoc """
  Documentation for ArkClient.Transport.
  """

  import ArkClient

  alias ArkClient.Models.{Block, Peer, Transaction}

  @doc """
  Get a single block.

  ## Examples

      iex> ArkClient.Transport.block(client, "887102556000070987")
      {:ok, []}
  """
  @spec block(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def block(client, id) do
    client
    |> get("peer/block", query: [id: id])
    |> handle_response
  end

  @doc """
  Get all blocks.

  ## Examples

      iex(4)> ArkClient.Transport.blocks(client)
      {:ok, []}
  """
  @spec blocks(Tesla.Client.t()) :: ArkClient.response()
  def blocks(client) do
    client
    |> get("peer/blocks")
    |> handle_response
  end

  @doc """
  Get a list of blocks by ids.

  WARNING: This doesn't seem to work.
  """
  @spec blocks_common(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def blocks_common(client, ids) do
    get(client, "peer/blocks/common", query: [ids: Enum.join(ids, ",")])
  end

  @doc """
  Create a new transaction.

  ## Examples

      iex> ArkClient.Transport.create_transactions(client, [transaction])
      {:ok,
       %{
         "success" => true,
         "transactionIds" => ["4a5f96b24091b747fb7fd34952ef465d9b8ec5f73d1b234405bf2718d2a87d56"]
       }}
  """
  @spec create_transactions(
    Tesla.Client.t(),
    List.t()
  ) :: ArkClient.response()
  def create_transactions(client, transactions) do
    post(client, "peer/transactions", %{transactions: transactions})
  end

  @doc """
  Get the blockchain height.

  ## Examples

      iex> ArkClient.Transport.height(client)
      {:ok,
       %{
         "header" => %{
           "blockSignature" => "30450221009b6db9d87349480877ae362aaca674e10fe5cf52f8607b55e95e1657dfbd979702206ded399a9f0b23bbd9dceab0a90a7e849f9577a7ae6eff3da59fabeb96d57c79",
           "generatorPublicKey" => "03b688ac6e5de290e4ab06e0d26f24db352334ff1491ea8a7d104f6c5e0753e90e",
           "height" => 3102741,
           "id" => "13011068016376141800",
           "numberOfTransactions" => 0,
           "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
           "payloadLength" => 0,
           "previousBlock" => "13773821774095119149",
           "reward" => 200000000,
           "timestamp" => 33487672,
           "totalAmount" => 0,
           "totalFee" => 0,
           "version" => 0
         },
         "height" => 3102741,
         "success" => true
       }}
  """
  @spec height(Tesla.Client.t()) :: ArkClient.response()
  def height(client) do
    get(client, "peer/height")
  end

  @doc """
  Get a list of peers.

  ## Examples

      iex> ArkClient.Transport.list(client)
      {:ok,
       [
         %ArkClient.Models.Peer{
           delay: 93,
           errors: 0,
           height: 3102404,
           ip: "167.114.29.35",
           os: "linux4.4.0-109-generic",
           port: 4002,
           status: "OK",
           version: "1.1.1"
         },
         %ArkClient.Models.Peer{delay: 210, errors: 0, height: 3102404, ...},
         %ArkClient.Models.Peer{delay: 360, errors: 0, ...},
         %ArkClient.Models.Peer{delay: 182, ...},
         %ArkClient.Models.Peer{...},
         ...
       ]}
  """
  @spec list(Tesla.Client.t()) :: ArkClient.response()
  def list(client) do
    client
    |> get("peer/list")
    |> handle_response
  end

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkClient.Transport.status(client)
      {:ok,
       %{
         "currentSlot" => 4185977,
         "forgingAllowed" => true,
         "header" => %{
           "blockSignature" => "3045022100f66a0745d2d1fa51e6d196fe5a8abfabc980cd84639e6550d32ef9b79082070502202c24890dbac5ad16a4ab40e4a3ac709b353dd183e69c54dcb94aa8f7139f9b34",
           "generatorPublicKey" => "03e5b39a83e6c7c952c5908089d4524bb8dda93acc2b2b953247e43dc4fe9aa3d1",
           "height" => 3102757,
           "id" => "16963473020282931345",
           "numberOfTransactions" => 0,
           "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
           "payloadLength" => 0,
           "previousBlock" => "7465286945457548527",
           "reward" => 200000000,
           "timestamp" => 33487816,
           "totalAmount" => 0,
           "totalFee" => 0,
           "version" => 0
         },
         "height" => 3102757,
         "success" => true
       }}
  """
  @spec status(Tesla.Client.t()) :: ArkClient.response()
  def status(client) do
    get(client, "peer/status")
  end

  @doc """
  Get a list of transactions.

  ## Examples

      iex> ArkClient.Transport.transactions(client)
      {:ok, []}
  """
  @spec transactions(Tesla.Client.t()) :: ArkClient.response()
  def transactions(client) do
    client
    |> get("peer/transactions")
    |> handle_response
  end

  @doc """
  Get a list of transactions by ids.

  ## Examples

      iex> ArkClient.Transport.transactions_from_ids(client, [id])
      {:ok, []}
  """
  @spec transactions_from_ids(
    Tesla.Client.t(),
    List.t()
  ) :: ArkClient.response()
  def transactions_from_ids(client, ids) do
    client
    |> get("peer/transactionsFromIds", query: [ids: Enum.join(ids, ",")])
    |> handle_response
  end

  # private

  defp handle_response({:ok, %{"block" => block}}) do
    {:ok, Block.build(block)}
  end

  defp handle_response({:ok, %{"blocks" => blocks}}) do
    {:ok, Enum.map(blocks, &Block.build/1)}
  end

  defp handle_response({:ok, %{"peers" => peers, "success" => true}}) do
    {:ok, Enum.map(peers, &Peer.build/1)}
  end

  defp handle_response({:ok, %{"transactions" => transactions}}) do
    {:ok, Enum.map(transactions, &Transaction.build/1)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
