defmodule ArkEcosystem.Client.API.DelegatesTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Delegates
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock(fn
      %{method: :get, url: "http://127.0.0.1:4003/api/delegates/dummyId"} ->
        json(%{"success" => true, "data" => %{id: "dummyId"}})

      %{method: :get, url: "http://127.0.0.1:4003/api/delegates"} ->
        json(%{"success" => true, "data" => [%{id: "dummyId"}]})

      %{method: :get, url: "http://127.0.0.1:4003/api/delegates/dummyId/blocks"} ->
        json(%{"success" => true, "data" => [%{id: "dummyBlockId"}]})

      %{method: :get, url: "http://127.0.0.1:4003/api/delegates/dummyId/voters"} ->
        json(%{"success" => true, "data" => [%{id: "dummyVoter"}]})
    end)

    :ok
  end

  test "call ArkEcosystem.Client.API.Delegates.list" do
    assert {:ok, response} = list(@client)
    assert Enum.at(response["data"], 0)["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Delegates.show" do
    assert {:ok, response} = show(@client, "dummyId")
    assert response["data"]["id"] == "dummyId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Delegates.blocks" do
    assert {:ok, response} = blocks(@client, "dummyId")
    assert Enum.at(response["data"], 0)["id"] == "dummyBlockId"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.Delegates.voters" do
    assert {:ok, response} = voters(@client, "dummyId")
    assert Enum.at(response["data"], 0)["id"] == "dummyVoter"
    assert response["success"] == true
  end
end
