defmodule ArkClient.BlockTest do
  use ExUnit.Case
  import ArkClient.Block

  @client ArkClient.Client.new(%{
            host: "https://dexplorer.ark.io:9443/",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkClient.Block.block" do
    response = block(@client, "16881146789693253434")

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.blocks" do
    response = blocks(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.epoch" do
    response = epoch(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.height" do
    response = height(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.nethash" do
    response = nethash(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.fees" do
    response = fees(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.milestone" do
    response = milestone(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.reward" do
    response = reward(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.supply" do
    response = supply(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Block.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end
end
