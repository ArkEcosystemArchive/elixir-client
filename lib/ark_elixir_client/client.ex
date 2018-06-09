defmodule ArkElixirClient.Client do
  @moduledoc """
  Documentation for ArkElixirClient.Client.

  This module generates a Tesla.Client for use in future requests. Feel free
  to make your own Tesla Client struct and pass that around.
  """
  @devnet_network_address <<0x1e>>
  @mainnet_network_address <<0x17>>

  def devnet_network_address, do: @devnet_network_address
  def mainnet_network_address, do: @mainnet_network_address

  @doc """
  Create a new instance.

  ## Examples

      iex> ArkElixirClient.Client.new(client)
      %Tesla.Client{
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["http://172.999.999.173:4002"]},
          {Tesla.Middleware.Headers, :call,
           [
             [
               {"Content-Type", "application/json"},
               {"nethash",
                "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23"},
               {"version", "1.1.1"},
               {"port", 1}
             ]
           ]},
          {Tesla.Middleware.JSON, :call, [[]]},
          {Tesla.Middleware.Logger, :call, [[log_level: :debug]]}
        ]
      }
  """
  @spec new(Map.t) :: Tesla.Client.t
  def new(%{
    nethash: nethash,
    network_address: network_address,
    url: url,
    version: version
  })
  when is_bitstring(nethash)
  and is_bitstring(network_address)
  and is_bitstring(url)
  and is_bitstring(version) do
    headers = [
      {"Content-Type", "application/json"},
      {"nethash", nethash},
      {"version", version},
      {"port", 1}
    ]

    log_level =
      case Application.get_env(:ark_elixir, :env, :prod) do
        :dev -> :debug
        _ -> :default
      end

    pre = [
      {Tesla.Middleware.BaseUrl, url},
      {Tesla.Middleware.Headers, headers},
      {Tesla.Middleware.JSON, []},
      {ArkElixirClient.Middleware.Logger, [log_level: log_level]},
    ]

    Tesla.build_client(pre)
  end

  def new(%{ip: ip, port: port, protocol: protocol} = opts) do
    opts
    |> Map.drop([:ip, :port, :protocol])
    |> Map.put(:url, "#{protocol}://#{ip}:#{port}")
    |> new
  end

  def new(_invalid) do
    :error
  end
end
