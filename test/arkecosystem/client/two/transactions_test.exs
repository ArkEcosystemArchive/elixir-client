defmodule ArkEcosystem.Client.API.Two.TransactionsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Two.Transaction
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/transactions/dummyId"} ->
        json(%{"success" => true, "data" => %{ "id": "dummyId" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/transactions"} ->
        json(%{"success" => true, "data" => [%{ "id": "dummyId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/transactions/unconfirmed/dummyUnconfirmedId"} ->
        json(%{"success" => true, "data" => %{ "id": "dummyUnconfirmedId" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/transactions/unconfirmed"} ->
        json(%{"success" => true, "data" => [%{ "id": "dummyUnconfirmedId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/transactions/types"} ->
        json(%{"success" => true, "data" => %{ "TRANSFER": 0 }})
      %{method: :post, url: "http://127.0.0.1:4003/api/transactions"} ->
        json(%{"success" => true, "data" => [%{ "id": "dummyUnconfirmedId" }]})
      %{method: :post, url: "http://127.0.0.1:4003/api/transactions/search", query: [q: "searchQuery"]} ->
        json(%{"success" => true, "data" => [%{ "id": "dummySearch" }]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.show" do
    assert {:ok, response} = show(@client, "dummyId")
    assert response["data"]["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.list_unconfirmed" do
    assert {:ok, response} = list_unconfirmed(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyUnconfirmedId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.get_unconfirmed" do
    assert {:ok, response} = get_unconfirmed(@client, "dummyUnconfirmedId")
    assert response["data"]["id"] == "dummyUnconfirmedId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.types" do
    assert {:ok, response} = types(@client)
    assert response["data"]["TRANSFER"] == 0
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.create" do
    assert {:ok, response} = create(@client, [q: "searchQuery"])
    assert Enum.at(response["data"], 0)["id"] == "dummySearch"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Transactions.search" do
    assert {:ok, response} = search(@client, [q: "searchQuery"])
    assert Enum.at(response["data"], 0)["id"] == "dummySearch"
    assert response["success"] == true
  end

end