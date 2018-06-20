defmodule ArkClient.Client do
  @moduledoc """
  Documentation for ArkClient.Client.

  This module generates a Tesla.Client for use in future requests. Feel free
  to make your own Tesla Client struct and pass that around.
  """
  @doc """
  Create a new instance.

  ## Examples

      iex> ArkClient.Client.new(client)
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
    host: host,
    version: version
  })
  when is_bitstring(nethash)
  and is_bitstring(host)
  and is_bitstring(version) do
    headers = [
      {"Content-Type", "application/json"},
      {"API-Version", version}
    ]

    log_level =
      case Application.get_env(:ark_elixir, :env, :prod) do
        :dev -> :debug
        _ -> :default
      end

    pre = [
      {Tesla.Middleware.BaseUrl, host},
      {Tesla.Middleware.Headers, headers},
      {Tesla.Middleware.JSON, []},
      {ArkClient.Middleware.Logger, [log_level: log_level]},
    ]

    Tesla.build_client(pre)
  end

  def new(_invalid) do
    :error
  end
end
