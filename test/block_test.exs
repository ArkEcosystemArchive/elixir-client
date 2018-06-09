defmodule ArkElixirClient.BlockTest do
  use ExUnit.Case
  import ArkElixirClient.Block

  @client ArkElixirClient.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixirClient.Client.devnet_network_address
          })

  test "call ArkElixirClient.Block.block" do
    response = block(@client, "16881146789693253434")

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.blocks" do
    response = blocks(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.epoch" do
    response = epoch(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.height" do
    response = height(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.nethash" do
    response = nethash(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.fees" do
    response = fees(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.milestone" do
    response = milestone(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.reward" do
    response = reward(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.supply" do
    response = supply(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Block.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end
end
