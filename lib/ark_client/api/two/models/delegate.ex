defmodule ArkClient.API.Two.Models.Delegate do
  @moduledoc """
  Delegate model.
  """
  @derive Jason.Encoder

  defstruct [
    :username,
    :address,
    :public_key,
    :votes,
    :rank,
    :blocks,
    :production
  ]

  @type t() :: %__MODULE__{
    username: String.t(),
    address: String.t(),
    public_key: String.t(),
    votes: Integer.t(),
    rank: Integer.t(),
    blocks: List.t(),
    production: List.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Delegate struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      username: Map.get(attributes, "username"),
      address: Map.get(attributes, "address"),
      public_key: Map.get(attributes, "publicKey"),
      votes: Map.get(attributes, "votes"),
      rank: Map.get(attributes, "rank"),
      blocks: Map.get(attributes, "blocks"),
      production: Map.get(attributes, "production")
    }
  end
end
