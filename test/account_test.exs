defmodule ArkElixirClient.AccountTest do
  use ExUnit.Case
  import ArkElixirClient.Account

  @client ArkElixirClient.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixirClient.Client.devnet_network_address
          })

  @account "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3"

  test "call ArkElixirClient.Account.balance" do
    response = balance(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Account.publickey" do
    response = publickey(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Account.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Account.delegates" do
    response = delegates(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixirClient.Account.account" do
    response = account(@client, @account)

    assert({:ok, _} = response)
  end
end
