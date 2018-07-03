defmodule ArkEcosystem.Client.API.One.SignatureTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Signature

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "signature get signature fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end
end
