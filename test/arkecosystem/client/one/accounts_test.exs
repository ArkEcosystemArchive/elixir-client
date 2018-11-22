defmodule ArkEcosystem.Client.API.One.AccountsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Accounts
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/getBalance", query: [address: "dummy"]} ->
        json(%{"success" => true, "fee" => 2500000000})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/getPublickey", query: [address: "dummy"]} ->
        json(%{"success" => true, "publicKey" => "dummy"})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/delegates/fee"} ->
        json(%{"success" => true, "fee" => 2500000000})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/delegates", query: [address: "dummy"]} ->
        json(%{"success" => true, "delegates" => [%{username: "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts", query: [address: "dummy"]} ->
        json(%{"success" => true, "account" => %{address: "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/count"} ->
        json(%{"success" => true, "count" => 42})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/getAllAccounts"} ->
        json(%{"success" => true, "accounts" => [%{address: "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/accounts/top"} ->
        json(%{"success" => true, "wallets" => [%{address: "dummy"}]})
    end
    :ok
  end

  @account "dummy"

  test "call ArkEcosystem.Client.API.One.Accounts.balance" do
    assert {:ok, response} = balance(@client, @account)
    assert response["fee"] == 2500000000
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.publickey" do
    assert {:ok, response} = publickey(@client, @account)
    assert response["publicKey"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.fee" do
    assert {:ok, response} = fee(@client)
    assert response["fee"] == 2500000000
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.delegates" do
    assert {:ok, response} = delegates(@client, @account)
    assert Enum.at(response["delegates"], 0)["username"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.account" do
    assert {:ok, response} = account(@client, @account)
    assert response["account"]["address"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.count" do
    assert {:ok, response} = count(@client)
    assert response["success"] == true
    assert response["count"] == 42
  end

  test "call ArkEcosystem.Client.API.One.Accounts.all" do
    assert {:ok, response} = all(@client)
    assert Enum.at(response["accounts"], 0)["address"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Accounts.top" do
    assert {:ok, response} = top(@client)
    assert Enum.at(response["wallets"], 0)["address"] == "dummy"
    assert response["success"] == true
  end
end
