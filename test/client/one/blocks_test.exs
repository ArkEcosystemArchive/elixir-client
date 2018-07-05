defmodule ArkEcosystem.Client.One.BlocksTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Blocks

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.API.One.Blocks.block" do
    response = block(@client, "16881146789693253434")

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.blocks" do
    response = blocks(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.epoch" do
    response = epoch(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.height" do
    response = height(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.nethash" do
    response = nethash(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.fees" do
    response = fees(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.milestone" do
    response = milestone(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.reward" do
    response = reward(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.supply" do
    response = supply(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Blocks.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end
end
