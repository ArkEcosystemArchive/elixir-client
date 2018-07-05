defmodule ArkEcosystem.Client.API.One.PeersTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Peers

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.API.One.Peers.peer" do
    response = peer(@client, "167.114.29.33", 8443)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Peers.peers" do
    response = peers(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Peers.version" do
    response = version(@client)

    assert({:ok, _} = response)
  end
end
