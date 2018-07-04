defmodule ArkEcosystem.Client.One.DelegatesTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Delegates

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.API.One.Delegates.count" do
    response = count(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.search" do
    response = search(@client, "bold", limit: 2)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.voters" do
    response =
      voters(@client, "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d")

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.delegate" do
    response =
      delegate(
        @client,
        publicKey: "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.delegates" do
    response = delegates(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.forged_by_account" do
    response =
      forged_by_account(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.next_forgers" do
    response = next_forgers(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Delegates.forging_status" do
    response =
      forging_status(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end
end
