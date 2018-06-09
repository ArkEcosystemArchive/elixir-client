defmodule ArkElixirClient.MultiSignatureTest do
  use ExUnit.Case
  import ArkElixirClient.MultiSignature

  @client ArkElixirClient.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixirClient.Client.devnet_network_address
          })

  test "multisignature get pending" do
    response =
      pending(@client, "02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de")

    assert({:ok, _} = response)
  end
end
