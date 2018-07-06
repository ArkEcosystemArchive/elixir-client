defmodule ArkEcosystem.Client.API.One.LoaderTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Loader
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/loader/status"} ->
        json(%{"success" => true, "loaded" => true})
      %{method: :get, url: "http://127.0.0.1:8443/api/loader/status/sync"} ->
        json(%{"success" => true, "syncing" => true})
      %{method: :get, url: "http://127.0.0.1:8443/api/loader/autoconfigure"} ->
        json(%{"success" => true, "network" => %{"token": "dummy"}})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.One.Loader.status" do
    assert {:ok, response} = status(@client)
    assert response["loaded"] == true
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Loader.sync" do
    assert {:ok, response} = sync(@client)
    assert response["syncing"] == true
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Loader.autoconfigure" do
    assert {:ok, response} = autoconfigure(@client)
    assert response["network"]["token"] == "dummy"
    assert response["success"] == true
  end
end
