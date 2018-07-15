defmodule ArkEcosystem.Client.One.DelegatesTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Delegates
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/count"} ->
        json(%{"success" => true, "count" => 42})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/search", query: [q: "bold", limit: 2]} ->
        json(%{"success" => true, "delegates" => [%{"username" => "boldninja"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/voters", query: [publicKey: "dummy"]} ->
        json(%{"success" => true, "accounts" => [%{"address": "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/get", query: [publicKey: "dummy"]} ->
        json(%{"success" => true, "delegate" => %{"username" => "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates"} ->
        json(%{"success" => true, "delegates" => [%{"username" => "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/fee"} ->
        json(%{"success" => true, "fee" => 2500000000})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/forging/getForgedByAccount", query: [generatorPublicKey: "dummy"]} ->
        json(%{"success" => true, "forged" => 42})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/getNextForgers"} ->
        json(%{"success" => true, "delegates" => ["dummy"]})
      %{method: :get, url: "http://127.0.0.1:8443/api/delegates/forging/status", query: [publicKey: "dummy"]} ->
        json(%{"success" => true, "enabled" => false})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.One.Delegates.count" do
    assert {:ok, response} = count(@client)
    assert response["count"] == 42
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.search" do
    assert {:ok, response} = search(@client, "bold", limit: 2)
    assert Enum.at(response["delegates"], 0)["username"] == "boldninja"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.voters" do
    assert {:ok, response} = voters(@client, "dummy")
    assert Enum.at(response["accounts"], 0)["address"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.delegate" do
    assert {:ok, response} = delegate(@client, publicKey: "dummy")
    assert response["delegate"]["username"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.delegates" do
    assert {:ok, response} = delegates(@client)
    assert Enum.at(response["delegates"], 0)["username"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.fee" do
    assert {:ok, response} = fee(@client)
    assert response["fee"] == 2500000000
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.forged_by_account" do
    assert {:ok, response} = forged_by_account(@client, "dummy")
    assert response["forged"] == 42
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.next_forgers" do
    assert {:ok, response} = next_forgers(@client)
    assert Enum.at(response["delegates"], 0) == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Delegates.forging_status" do
    assert {:ok, response} = forging_status(@client, "dummy")
    assert response["enabled"] == false
    assert response["success"] == true
  end
end
