defmodule ArkClient.API.Two.Models.Peer do
  @moduledoc """
  Peer model.
  """
  @derive Jason.Encoder

  defstruct [
    :dummy
  ]

  @type t() :: %__MODULE__{
    dummy: Integer.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Peer struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      dummy: Map.get(attributes, "dummy")
    }
  end
end
