defmodule ArkClient.API.One.Models.Delegate do
  @moduledoc """
  Delegate model.
  """
  @derive Jason.Encoder

  defstruct [
    :address,
    :approval,
    :missedblocks,
    :producedblocks,
    :productivity,
    :public_key,
    :rate,
    :username,
    :vote
  ]

  @type t() :: %__MODULE__{
    address: String.t(),
    approval: Float.t(),
    missedblocks: Integer.t(),
    producedblocks: Integer.t(),
    productivity: Float.t(),
    public_key: String.t(),
    rate: Integer.t(),
    username: String.t(),
    vote: String.t()
  }

  @doc """
  Builds an ArkClient.API.One.Models.Delegate struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      address: Map.get(attributes, "address"),
      approval: Map.get(attributes, "approval"),
      missedblocks: Map.get(attributes, "missedblocks"),
      producedblocks: Map.get(attributes, "producedblocks"),
      productivity: Map.get(attributes, "productivity"),
      public_key: Map.get(attributes, "publicKey"),
      rate: Map.get(attributes, "rate"),
      username: Map.get(attributes, "username"),
      vote: Map.get(attributes, "vote")
    }
  end
end
