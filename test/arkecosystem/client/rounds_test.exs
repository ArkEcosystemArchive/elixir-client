defmodule ArkEcosystem.Client.API.RoundsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.Rounds
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:4003/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:4003/api/rounds/12345/delegates"} ->
        json(%{"success" => true, "data" => [%{type: 0}]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.Rounds.delegates" do
    assert {:ok, response} = delegates(@client, 12345)
    assert Enum.at(response["data"], 0)["type"] == 0
    assert response["success"] == true
  end

end
