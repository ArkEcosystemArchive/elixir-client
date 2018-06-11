defmodule ArkClient.TransportTest do
  use ExUnit.Case
  import ArkClient.Transport

  @client ArkClient.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkClient.Client.devnet_network_address
          })

  test "call ArkClient.Transport.list" do
    response = list(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.blocks_common" do
    # NOTE: This endpoint doesn't seem to work anymore
    # response = blocks_common(@client, ["8016767837068034280"])
    #
    # assert(response["common"]["id"] === "8016767837068034280")
  end

  test "call ArkClient.Transport.block" do
    response =
      block(
        @client,
        "8016767837068034280"
      )

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.blocks" do
    response = blocks(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.transactions" do
    response = transactions(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.transactions_from_ids" do
    response =
      transactions_from_ids(
        @client,
        ["83ef2532e0c7c2070fad98b5c1a3d63e0d18460acf2696eafa0e852c1dfabf79"]
      )

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.height" do
    response = height(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Transport.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end
end
