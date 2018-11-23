defmodule ArkEcosystem.Client.API.Two.BlocksTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Two.Blocks
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/blocks/dummyId"} ->
        json(%{"success" => true, "data" => %{ id: "dummyId" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/blocks"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/blocks/dummyId/transactions"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyTransactionId" }]})
      %{method: :post, url: "http://127.0.0.1:4003/api/blocks/search"} ->
        json(%{"success" => true, "data" => [%{ id: "dummySearch" }]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Two.Blocks.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Blocks.show" do
    assert {:ok, response} = show(@client, "dummyId")
    assert response["data"]["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Blocks.transactions" do
    assert {:ok, response} = transactions(@client, "dummyId")
    assert Enum.at(response["data"], 0)["id"] == "dummyTransactionId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Blocks.search" do
    assert {:ok, response} = search(@client, %{q: "searchQuery"})
    assert Enum.at(response["data"], 0)["id"] == "dummySearch"
    assert response["success"] == true
  end

end
