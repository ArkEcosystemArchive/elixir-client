defmodule ArkEcosystem.Client.API.One.PeersTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Peers
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/peers/get", query: [ip: "0.0.0.0", port: 0]} ->
        json(%{"success" => true, "peer" => %{"ip" => "0.0.0.0"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/peers"} ->
        json(%{"success" => true, "peers" => [%{"ip" => "0.0.0.0"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/peers/version"} ->
        json(%{"success" => true, "version" => "1"})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.One.Peers.peer" do
    assert {:ok, response} = peer(@client, "0.0.0.0", 0)
    assert response["peer"]["ip"] == "0.0.0.0"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Peers.peers" do
    assert {:ok, response} = peers(@client)
    assert Enum.at(response["peers"], 0)["ip"] == "0.0.0.0"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Peers.version" do
    assert {:ok, response} = version(@client)
    assert response["version"] == "1"
    assert response["success"] == true
  end
end
