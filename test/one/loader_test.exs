defmodule ArkClient.LoaderTest do
  use ExUnit.Case
  import ArkClient.Loader

  @client ArkClient.Client.new(%{
            host: "https://dexplorer.ark.io:9443/",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkClient.Loader.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Loader.sync" do
    response = sync(@client)

    assert({:ok, _} = response)
  end

  test "call ArkClient.Loader.autoconfigure" do
    response = autoconfigure(@client)

    assert({:ok, _} = response)
  end
end
