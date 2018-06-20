defmodule ArkClient.One.Models.Peer do
  @moduledoc """
  Peer model.
  """
  @derive Jason.Encoder

  defstruct [
    :delay,
    :errors,
    :height,
    :ip,
    :os,
    :port,
    :status,
    :version
  ]

  @type t() :: %__MODULE__{
    delay: Integer.t(),
    errors: Integer.t(),
    height: Integer.t(),
    ip: String.t(),
    os: String.t(),
    port: Integer.t(),
    status: String.t(),
    version: String.t()
  }

  @doc """
  Builds an ArkClient.One.Models.Peer struct from the API response map.
  """
  def build(attributes) do
    %__MODULE__{
      delay: Map.get(attributes, "delay"),
      errors: Map.get(attributes, "errors"),
      height: Map.get(attributes, "height"),
      ip: Map.get(attributes, "ip"),
      os: Map.get(attributes, "os"),
      port: Map.get(attributes, "port"),
      status: Map.get(attributes, "status"),
      version: Map.get(attributes, "version")
    }
  end
end
