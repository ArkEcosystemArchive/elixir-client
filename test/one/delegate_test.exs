defmodule ArkEcosystem.Client.DelegateTest do
  use ExUnit.Case
  import ArkEcosystem.Client.Delegate

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.Delegate.count" do
    response = count(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.search" do
    response = search(@client, "bold", limit: 2)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.voters" do
    response =
      voters(@client, "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d")

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.delegate" do
    response =
      delegate(
        @client,
        publicKey: "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.delegates" do
    response = delegates(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.forged_by_account" do
    response =
      forged_by_account(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.next_forgers" do
    response = next_forgers(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Delegate.forging_status" do
    response =
      forging_status(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert({:ok, _} = response)
  end
end
