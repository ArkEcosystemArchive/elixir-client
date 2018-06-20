defmodule ArkClient.API.Two.Models.Transaction do
  @moduledoc """
  Transaction model.
  """
  @derive Jason.Encoder

  defstruct [
    :id,
    :block_id,
    :type,
    :amount,
    :fee,
    :sender,
    :recipient,
    :signature,
    :vendor_field,
    :asset,
    :confirmations,
    :timestamp
  ]

  @type t() :: %__MODULE__{
    id: String.t(),
    block_id: String.t(),
    type: Integer.t(),
    amount: Integer.t(),
    fee: Integer.t(),
    sender: String.t(),
    recipient: String.t(),
    signature: String.t(),
    vendor_field: String.t(),
    asset: List.t(),
    confirmations: Integer.t(),
    timestamp: List.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Transaction struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      id: Map.get(attributes, "id"),
      block_id: Map.get(attributes, "blockId"),
      type: Map.get(attributes, "type"),
      amount: Map.get(attributes, "amount"),
      fee: Map.get(attributes, "fee"),
      sender: Map.get(attributes, "sender"),
      recipient: Map.get(attributes, "recipient"),
      signature: Map.get(attributes, "signature"),
      vendor_field: Map.get(attributes, "vendorField"),
      asset: Map.get(attributes, "asset"),
      confirmations: Map.get(attributes, "confirmations"),
      timestamp: Map.get(attributes, "timestamp"),
    }
  end
end
