defmodule ArkEcosystem.Client.API.One.SignaturesTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Signatures
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/signatures/fee"} ->
        json(%{"success" => true, "fee" => 500000000})
    end
    :ok
  end

  test "signature get signatures fee" do
    assert {:ok, response} = fee(@client)
    assert response["fee"] == 500000000
    assert response["success"] == true
  end
end
