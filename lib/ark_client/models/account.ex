defmodule ArkClient.Models.Account do
  @moduledoc """
  Account model.
  """
  @derive Jason.Encoder

  defstruct [
    :address,
    :balance,
    :multisignatures,
    :public_key,
    :second_public_key,
    :second_signature,
    :u_multisignatures,
    :unconfirmed_balance,
    :unconfirmed_signature
  ]

  @type t() :: %__MODULE__{
    address: String.t(),
    balance: Integer.t(),
    multisignatures: List.t(),
    public_key: String.t(),
    second_public_key: String.t(),
    second_signature: Integer.t(),
    u_multisignatures: List.t(),
    unconfirmed_balance: Integer.t(),
    unconfirmed_signature: Integer.t()
  }

  @doc """
  Builds an ArkClient.Models.Account struct from the API response map.
  """
  @spec build(Map.t()) :: t()
  def build(%{"address" => address} = attributes) do
    %__MODULE__{
      address: address,
      balance: Map.get(attributes, "balance"),
      multisignatures: Map.get(attributes, "multisignatures"),
      public_key: Map.get(attributes, "publicKey"),
      second_public_key: Map.get(attributes, "secondPublicKey"),
      second_signature: Map.get(attributes, "secondSignature"),
      u_multisignatures: Map.get(attributes, "u_multisignatures"),
      unconfirmed_balance: Map.get(attributes, "unconfirmedBalance"),
      unconfirmed_signature: Map.get(attributes, "unconfirmedSignature")
    }
  end
end
