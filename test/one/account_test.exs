defmodule ArkEcosystem.Client.AccountTest do
  use ExUnit.Case
  import ArkEcosystem.Client.Account

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  @account "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3"

  test "call ArkEcosystem.Client.Account.balance" do
    response = balance(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Account.publickey" do
    response = publickey(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Account.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Account.delegates" do
    response = delegates(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.Account.account" do
    response = account(@client, @account)

    assert({:ok, _} = response)
  end
end
