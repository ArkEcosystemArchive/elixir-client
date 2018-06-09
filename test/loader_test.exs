defmodule ArkElixirClient.LoaderTest do
  use ExUnit.Case
  import ArkElixirClient.Loader

  @client ArkElixirClient.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixirClient.Client.devnet_network_address
          })

  test "call ArkElixirClient.Loader.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Loader.sync" do
    response = sync(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Loader.autoconfigure" do
    response = autoconfigure(@client)

    assert({:ok, _} = response)
  end
end
