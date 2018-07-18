defmodule ArkEcosystem.Client.API.Two.PeersTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Two.Peer
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/peers/0.0.0.0"} ->
        json(%{"success" => true, "data" => %{ "ip": "0.0.0.0" }})
      %{method: :get, url: "http://127.0.0.1:4003/api/peers"} ->
        json(%{"success" => true, "data" => [%{ "ip": "0.0.0.0" }]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Two.Peer.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"], 0)["ip"] == "0.0.0.0"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Two.Peer.show" do
    assert {:ok, response} = show(@client, "0.0.0.0")
    assert response["data"]["ip"] == "0.0.0.0"
    assert response["success"] == true
  end

end
