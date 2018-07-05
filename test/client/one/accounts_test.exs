defmodule ArkEcosystem.Client.API.One.AccountsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Accounts

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  @account "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3"

  test "call ArkEcosystem.Client.API.One.Accounts.balance" do
    response = balance(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Accounts.publickey" do
    response = publickey(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Accounts.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Accounts.delegates" do
    response = delegates(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Accounts.account" do
    response = account(@client, @account)

    assert({:ok, _} = response)
  end
end
