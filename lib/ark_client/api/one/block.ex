defmodule ArkEcosystem.Client.API.One.Block do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Block.
  """

  import ArkEcosystem.Client

  @doc """
  Get block by id.

  ## Examples

      iex(3)> ArkEcosystem.Client.API.One.Block.block(client, "887102556000070987")
      {:ok,
       %ArkEcosystem.Client.API.One.Models.Block{
         block_signature: "3045022100cf25e7aa0ad979b8a681930dda181337f6aec2f45f95fc15f8082a0acab7d501022061e66f303278245abeb30ec63e9cf282d6180d1f10439f0b11741bafa52a8e18",
         confirmations: 27,
         generator_id: "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA",
         generator_public_key: "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456",
         height: 3102078,
         id: "887102556000070987",
         number_of_transactions: 0,
         payload_hash: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
         payload_length: 0,
         previous_block: "4763192919900613939",
         reward: 200000000,
         timestamp: 33481344,
         total_amount: 0,
         total_fee: 0,
         total_forged: "200000000",
         version: 0
       }}
  """
  @spec block(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def block(client, id) do
    client |> get("blocks/get", query: [id: id])
  end

  @doc """
  Get all blocks.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.blocks(client)
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Block{
           block_signature: "3045022100cf25e7aa0ad979b8a681930dda181337f6aec2f45f95fc15f8082a0acab7d501022061e66f303278245abeb30ec63e9cf282d6180d1f10439f0b11741bafa52a8e18",
           confirmations: 1,
           generator_id: "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA",
           generator_public_key: "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456",
           height: 3102078,
           id: "887102556000070987",
           number_of_transactions: 0,
           payload_hash: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
           payload_length: 0,
           previous_block: "4763192919900613939",
           reward: 200000000,
           timestamp: 33481344,
           total_amount: 0,
           total_fee: 0,
           total_forged: "200000000",
           version: 0
         },
         %ArkEcosystem.Client.API.One.Models.Block{...},
         %ArkEcosystem.Client.API.One.Models.Block{...},
         %ArkEcosystem.Client.API.One.Models.Block{...},
         %ArkEcosystem.Client.API.One.Models.Block{...},
         ...
       ]}
  """
  @spec blocks(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def blocks(client, parameters \\ []) do
    client |> get("blocks", query: parameters)
  end

  @doc """
  Get the blockchain epoch.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.epoch(client)
      {:ok, "2017-03-21T13:00:00.000Z"}
  """
  @spec epoch(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def epoch(client) do
    client |> get("blocks/getEpoch")
  end

  @doc """
  Get the transaction fee for sending "normal" transactions

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.fee(client)
      {:ok, 10000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fee(client) do
    client |> get("blocks/getFee")
  end

  @doc """
  Get the network fees.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.fees(client)
      {:ok,
       %{
         "delegate" => 2500000000,
         "multisignature" => 500000000,
         "secondsignature" => 500000000,
         "send" => 10000000,
         "vote" => 100000000
       }}
  """
  @spec fees(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fees(client) do
    client |> get("blocks/getFees")
  end

  @doc """
  Get the blockchain height.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.height(client)
      {:ok, %{"height" => 3102123, "id" => "6065299679901800950", "success" => true}}
  """
  @spec height(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def height(client) do
    client |> get("blocks/getHeight")
  end

  @doc """
  Get the blockchain milestone.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.milestone(client)
      {:ok, 1}
  """
  @spec milestone(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def milestone(client) do
    client |> get("blocks/getMilestone")
  end

  @doc """
  Get the blockchain nethash.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.nethash(client)
      {:ok, "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23"}
  """
  @spec nethash(Tesla.Client) :: ArkEcosystem.Client.response()
  def nethash(client) do
    client |> get("blocks/getNethash")
  end

  @doc """
  Get the blockchain reward.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.reward(client)
      {:ok, 200000000}
  """
  @spec reward(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def reward(client) do
    client |> get("blocks/getReward")
  end

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.status(client)
      {:ok,
       %{
         "epoch" => "2017-03-21T13:00:00.000Z",
         "fee" => 10000000,
         "height" => 3102147,
         "milestone" => 1,
         "nethash" => "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
         "reward" => 200000000,
         "success" => true,
         "supply" => 13120429400000000
       }}
  """
  @spec status(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def status(client) do
    client |> get("blocks/getStatus")
  end

  @doc """
  Get the blockchain supply.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Block.supply(client)
      {:ok, 13120431600000000}

  """
  @spec supply(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def supply(client) do
    client |> get("blocks/getSupply")
  end
end
