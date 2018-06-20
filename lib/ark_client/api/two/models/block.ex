defmodule ArkClient.API.Two.Models.Block do
  @moduledoc """
  Block model.
  """
  @derive Jason.Encoder

  defstruct [
    :id,
    :version,
    :height,
    :previous,
    :forged,
    :payload,
    :generator,
    :signature,
    :transactions,
    :timestamp,
  ]

  @type t() :: %__MODULE__{
    id: String.t(),
    version: Integer.t(),
    height: Integer.t(),
    previous: String.t(),
    forged: List.t(),
    payload: List.t(),
    generator: List.t(),
    signature: String.t(),
    transactions: Integer.t(),
    timestamp: List.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Block struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      id: Map.get(attributes, "id"),
      version: Map.get(attributes, "version"),
      height: Map.get(attributes, "height"),
      previous: Map.get(attributes, "previous"),
      forged: Map.get(attributes, "forged"),
      payload: Map.get(attributes, "payload"),
      generator: Map.get(attributes, "generator"),
      signature: Map.get(attributes, "signature"),
      transactions: Map.get(attributes, "transactions"),
      timestamp: Map.get(attributes, "timestamp")
    }
  end
end
