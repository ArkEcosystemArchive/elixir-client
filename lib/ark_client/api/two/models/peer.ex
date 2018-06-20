defmodule ArkClient.API.Two.Models.Peer do
  @moduledoc """
  Peer model.
  """
  @derive Jason.Encoder

  defstruct [
    :ip,
    :port,
    :version,
    :height,
    :status,
    :os,
    :latency
  ]

  @type t() :: %__MODULE__{
    ip: String.t(),
    port: Integer.t(),
    version: String.t(),
    height: Integer.t(),
    status: String.t(),
    os: String.t(),
    latency: Integer.t()
  }

  @doc """
  Builds an ArkClient.API.Two.Models.Peer struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      ip: Map.get(attributes, "ip"),
      port: Map.get(attributes, "port"),
      version: Map.get(attributes, "version"),
      height: Map.get(attributes, "height"),
      status: Map.get(attributes, "status"),
      os: Map.get(attributes, "os"),
      latency: Map.get(attributes, "latency")
    }
  end
end
