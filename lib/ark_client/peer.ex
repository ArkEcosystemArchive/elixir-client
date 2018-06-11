defmodule ArkClient.Peer do
  @moduledoc """
  Documentation for ArkClient.Peer.
  """

  import ArkClient

  alias ArkClient.Models.Peer

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkClient.Peer.peer(client, "167.114.29.35", 4002)
      {:ok,
       %ArkClient.Models.Peer{
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
    client
    |> get("api/peers/get", query: [ip: ip, port: port])
    |> handle_response
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkClient.Peer.peers(client)
      {:ok,
       [
         %ArkClient.Models.Peer{
           delay: 93,
           errors: 0,
           height: 3102404,
           ip: "167.114.29.35",
           os: "linux4.4.0-109-generic",
           port: 4002,
           status: "OK",
           version: "1.1.1"
         },
         %ArkClient.Models.Peer{delay: 210, errors: 0, height: 3102404, ...},
         %ArkClient.Models.Peer{delay: 360, errors: 0, ...},
         %ArkClient.Models.Peer{delay: 182, ...},
         %ArkClient.Models.Peer{...},
         ...
       ]}
  """
  @spec peers(Tesla.Client.t(), Keyword.t()) :: ArkClient.response()
  def peers(client, parameters \\ []) do
    client
    |> get("api/peers", query: parameters)
    |> handle_response
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkClient.Peer.version(client)
      {:ok, "1.1.1"}
  """
  @spec version(Tesla.Client.t()) :: ArkClient.response()
  def version(client) do
    get(client, "api/peers/version")
    client
    |> get("api/peers/version")
    |> case do
      {:ok, %{"version" => version, "success" => true}} -> {:ok, version}
      {:ok, invalid_response} -> {:error, invalid_response}
      {:error, _message} = error -> error
    end
  end

  # private

  defp handle_response({:ok, %{"peer" => peer, "success" => true}}) do
    {:ok, Peer.build(peer)}
  end

  defp handle_response({:ok, %{"peers" => peers, "success" => true}}) do
    {:ok, Enum.map(peers, &Peer.build/1)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
