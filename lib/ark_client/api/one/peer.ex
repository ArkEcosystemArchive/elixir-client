defmodule ArkClient.API.One.Peer do
  @moduledoc """
  Documentation for ArkClient.API.One.Peer.
  """

  import ArkClient

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkClient.API.One.Peer.peer(client, "167.114.29.35", 4002)
      {:ok,
       %ArkClient.API.One.Models.Peer{
         delay: 85,
         errors: 0,
         height: 3102404,
         ip: "167.114.29.35",
         os: "linux4.4.0-109-generic",
         port: 4002,
         status: "OK",
         version: "1.1.1"
       }}
  """
  @spec peer(Tesla.Client.t(), String.t(), Integer.t()) :: ArkClient.response()
  def peer(client, ip, port) do
    get(client, "api/peers/get", query: [ip: ip, port: port])
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkClient.API.One.Peer.peers(client)
      {:ok,
       [
         %ArkClient.API.One.Models.Peer{
           delay: 93,
           errors: 0,
           height: 3102404,
           ip: "167.114.29.35",
           os: "linux4.4.0-109-generic",
           port: 4002,
           status: "OK",
           version: "1.1.1"
         },
         %ArkClient.API.One.Models.Peer{delay: 210, errors: 0, height: 3102404, ...},
         %ArkClient.API.One.Models.Peer{delay: 360, errors: 0, ...},
         %ArkClient.API.One.Models.Peer{delay: 182, ...},
         %ArkClient.API.One.Models.Peer{...},
         ...
       ]}
  """
  @spec peers(Tesla.Client.t(), Keyword.t()) :: ArkClient.response()
  def peers(client, parameters \\ []) do
    get(client, "api/peers", query: parameters)
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkClient.API.One.Peer.version(client)
      {:ok, "1.1.1"}
  """
  @spec version(Tesla.Client.t()) :: ArkClient.response()
  def version(client) do
    get(client, "api/peers/version")
    end
  end
end
