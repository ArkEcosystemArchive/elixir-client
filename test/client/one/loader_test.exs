defmodule ArkEcosystem.Client.API.One.LoaderTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Loader

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.API.One.Loader.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Loader.sync" do
    response = sync(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Loader.autoconfigure" do
    response = autoconfigure(@client)

    assert({:ok, _} = response)
  end
end
