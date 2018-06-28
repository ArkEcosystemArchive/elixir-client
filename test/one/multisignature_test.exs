defmodule ArkEcosystem.Client.MultiSignatureTest do
  use ExUnit.Case
  import ArkEcosystem.Client.MultiSignature

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "multisignature get pending" do
    response =
      pending(@client, "02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de")

    assert({:ok, _} = response)
  end
end
