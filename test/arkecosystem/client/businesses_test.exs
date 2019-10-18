defmodule ArkEcosystem.Client.API.BusinessesTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Businesses
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/businesses/dummyId"} ->
        json(%{"success" => true, "data" => %{ id: "dummyId" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/businesses"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyId" }]})
      %{method: :get, url: "http://127.0.0.1:4003/api/businesses/dummyId/bridgechains"} ->
        json(%{"success" => true, "data" => [%{ id: "dummyBridgechainId" }]})
      %{method: :post, url: "http://127.0.0.1:4003/api/businesses/search"} ->
        json(%{"success" => true, "data" => [%{ id: "dummySearch" }]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Businesses.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"],0)["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Businesses.show" do
    assert {:ok, response} = show(@client, "dummyId")
    assert response["data"]["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Businesses.bridgechains" do
    assert {:ok, response} = bridgechains(@client, "dummyId")
    assert Enum.at(response["data"], 0)["id"] == "dummyBridgechainId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Businesses.search" do
    assert {:ok, response} = search(@client, %{q: "searchQuery"})
    assert Enum.at(response["data"], 0)["id"] == "dummySearch"
    assert response["success"] == true
  end

end
