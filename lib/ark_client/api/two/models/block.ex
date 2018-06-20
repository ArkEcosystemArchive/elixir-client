defmodule ArkClient.API.Two.Models.Block do
  @moduledoc """
  Block model.
  """
  @derive Jason.Encoder

  defstruct [
    :dummy
  ]

  @type t() :: %__MODULE__{
    dummy: Integer.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Block struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      dummy: Map.get(attributes, "dummy")
    }
  end
end
