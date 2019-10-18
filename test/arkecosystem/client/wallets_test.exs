defmodule ArkEcosystem.Client.API.WalletsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Wallets
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId"} ->
        json(%{"success" => true, "data" => %{ id: "dummyId" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/top"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyTopId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId/locks"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyLockId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId/transactions"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyTransactionId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId/transactions/sent"} ->
        json(%{"success" => true, "data" => [%{ id: "dummySentTransactionId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId/transactions/received"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyReceivedTransactionId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/wallets/dummyId/votes"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyVoteId" }]})
      %{method: :post, url: "http://127.0.0.1:4003/api/wallets/search"} ->
        json(%{"success" => true, "data" => [%{ id: "dummySearch" }]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Wallets.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.show" do
    assert {:ok, response} = show(@client, "dummyId")
    assert response["data"]["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.top" do
    assert {:ok, response} = top(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyTopId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.locks" do
    assert {:ok, response} = locks(@client, "dummyId")
    assert Enum.at(response["data"],0)["id"] == "dummyLockId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.transactions" do
    assert {:ok, response} = transactions(@client, "dummyId")
    assert Enum.at(response["data"],0)["id"] == "dummyTransactionId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.sent_transactions" do
    assert {:ok, response} = sent_transactions(@client, "dummyId")
    assert Enum.at(response["data"],0)["id"] == "dummySentTransactionId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.received_transactions" do
    assert {:ok, response} = received_transactions(@client, "dummyId")
    assert Enum.at(response["data"],0)["id"] == "dummyReceivedTransactionId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.votes" do
    assert {:ok, response} = votes(@client, "dummyId")
    assert Enum.at(response["data"],0)["id"] == "dummyVoteId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Wallets.search" do
    assert {:ok, response} = search(@client, %{q: "searchQuery"})
    assert Enum.at(response["data"], 0)["id"] == "dummySearch"
    assert response["success"] == true
  end

end
