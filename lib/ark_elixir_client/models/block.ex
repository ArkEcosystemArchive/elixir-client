defmodule ArkElixirClient.Models.Block do
  @moduledoc """
  Block model.
  """
  @derive Jason.Encoder

  defstruct [
    :block_signature,
    :confirmations,
    :generator_id,
    :generator_public_key,
    :height,
    :id,
    :number_of_transactions,
    :payload_hash,
    :payload_length,
    :previous_block,
    :reward,
    :timestamp,
    :total_amount,
    :total_fee,
    :total_forged,
    :version
  ]

  @type t() :: %__MODULE__{
    block_signature: String.t(),
    confirmations: Integer.t(),
    generator_id: String.t(),
    generator_public_key: String.t(),
    height: Integer.t(),
    id: Integer.t(),
    number_of_transactions: Integer.t(),
    payload_hash: String.t(),
    payload_length: Integer.t(),
    previous_block: Integer.t(),
    reward: Integer.t(),
    timestamp: Integer.t(),
    total_amount: Integer.t(),
    total_fee: Integer.t(),
    total_forged: Integer.t(),
    version: Integer.t()
  }

  @doc """
  Builds an ArkElixirClient.Models.Block struct from the API response map.
  """
  @spec build(Map.t()) :: t()
  def build(%{"id" => id} = attributes) do
    %__MODULE__{
      block_signature: Map.get(attributes, "blockSignature"),
      confirmations: Map.get(attributes, "confirmations"),
      generator_id: Map.get(attributes, "generatorId"),
      generator_public_key: Map.get(attributes, "generatorPublicKey"),
      height: Map.get(attributes, "height"),
      id: id,
      number_of_transactions: Map.get(attributes, "numberOfTransactions"),
      payload_hash: Map.get(attributes, "payloadHash"),
      payload_length: Map.get(attributes, "payloadLength"),
      previous_block: Map.get(attributes, "previousBlock"),
      reward: Map.get(attributes, "reward"),
      timestamp: Map.get(attributes, "timestamp"),
      total_amount: Map.get(attributes, "totalAmount"),
      total_fee: Map.get(attributes, "totalFee"),
      total_forged: Map.get(attributes, "totalForged"),
      version: Map.get(attributes, "version")
    }
  end
end
