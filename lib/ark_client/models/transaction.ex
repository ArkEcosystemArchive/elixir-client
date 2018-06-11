defmodule ArkClient.Models.Transaction do
  @moduledoc """
  Transaction model.
  """
  @derive Jason.Encoder

  defstruct [
    :amount,
    :asset,
    :blockid,
    :confirmations,
    :fee,
    :height,
    :id,
    :recipient_id,
    :sender_id,
    :sender_public_key,
    :timestamp,
    :type,
    :vendor_field
  ]

  @type t() :: %__MODULE__{
    amount: Integer.t(),
    asset: Map.t(),
    blockid: Integer.t(),
    confirmations: Integer.t(),
    fee: Integer.t(),
    height: Integer.t(),
    id: String.t(),
    recipient_id: String.t(),
    sender_id: String.t(),
    sender_public_key: String.t(),
    timestamp: Integer.t(),
    type: Integer.t(),
    vendor_field: String.t()
  }

  @doc """
  Builds an ArkClient.Models.Transaction struct from the API response map.
  """
  def build(nil) do
    %__MODULE__{}
  end

  def build(attributes) do
    %__MODULE__{
      amount: Map.get(attributes, "amount"),
      asset: Map.get(attributes, "asset"),
      blockid: Map.get(attributes, "blockid"),
      confirmations: Map.get(attributes, "confirmations"),
      fee: Map.get(attributes, "fee"),
      height: Map.get(attributes, "height"),
      id: Map.get(attributes, "id"),
      recipient_id: Map.get(attributes, "recipientId"),
      sender_id: Map.get(attributes, "senderId"),
      sender_public_key: Map.get(attributes, "senderPublicKey"),
      timestamp: Map.get(attributes, "timestamp"),
      type: Map.get(attributes, "type"),
      vendor_field: Map.get(attributes, "vendorField")
    }
  end
end
