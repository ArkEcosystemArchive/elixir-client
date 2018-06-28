defmodule ArkEcosystem.Client.API.One.Peer do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Peer.
  """

  import ArkClient

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Peer.peer(client, "167.114.29.35", 4002)
      {:ok,
       %ArkEcosystem.Client.API.One.Models.Peer{
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
  @spec peer(Tesla.Client.t(), String.t(), Integer.t()) :: ArkEcosystem.Client.response()
  def peer(client, ip, port) do
    client |> get("peers/get", query: [ip: ip, port: port])
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Peer.peers(client)
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Peer{
           delay: 93,
           errors: 0,
           height: 3102404,
           ip: "167.114.29.35",
           os: "linux4.4.0-109-generic",
           port: 4002,
           status: "OK",
           version: "1.1.1"
         },
         %ArkEcosystem.Client.API.One.Models.Peer{delay: 210, errors: 0, height: 3102404, ...},
         %ArkEcosystem.Client.API.One.Models.Peer{delay: 360, errors: 0, ...},
         %ArkEcosystem.Client.API.One.Models.Peer{delay: 182, ...},
         %ArkEcosystem.Client.API.One.Models.Peer{...},
         ...
       ]}
  """
  @spec peers(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def peers(client, parameters \\ []) do
    client |> get("peers", query: parameters)
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Peer.version(client)
      {:ok, "1.1.1"}
  """
  @spec version(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def version(client) do
    client |> get("peers/version")
    end
  end
end
