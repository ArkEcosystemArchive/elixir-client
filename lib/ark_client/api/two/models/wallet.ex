defmodule ArkClient.API.Two.Models.Wallet do
  @moduledoc """
  Wallet model.
  """
  @derive Jason.Encoder

  defstruct [
    :address,
    :public_key,
    :balance,
    :is_delegate
  ]

  @type t() :: %__MODULE__{
    address: String.t(),
    public_key: String.t(),
    balance: Integer.t(),
    is_delegate: Boolean.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Wallet struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      address: Map.get(attributes, "address"),
      public_key: Map.get(attributes, "publicKey"),
      balance: Map.get(attributes, "balance"),
      is_delegate: Map.get(attributes, "isDelegate")
    }
  end
end
