defmodule ArkEcosystem.Client.API.Two.NodeTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Two.Node
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/node/status"} ->
        json(%{"success" => true, "data" => %{ synced: true }})
      %{method: :get, url: "http://127.0.0.1:4003/api/node/syncing"} ->
        json(%{"success" => true, "data" => %{ syncing: true }})
      %{method: :get, url: "http://127.0.0.1:4003/api/node/configuration"} ->
        json(%{"success" => true, "data" => %{ nethash: "dummyHash" }})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Two.Node.status" do
    assert {:ok, response} = status(@client)
    assert response["data"]["synced"] == true
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Node.syncing" do
    assert {:ok, response} = syncing(@client)
    assert response["data"]["syncing"] == true
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Node.configuration" do
    assert {:ok, response} = configuration(@client)
    assert response["data"]["nethash"] == "dummyHash"
    assert response["success"] == true
  end

end
