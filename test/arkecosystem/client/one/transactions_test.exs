defmodule ArkEcosystem.Client.API.One.TransactionsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Transactions
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      %{method: :get, url: "http://127.0.0.1:8443/api/transactions/get", query: [id: "dummy"]} ->
        json(%{"success" => true, "transaction" => %{id: "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/transactions"} ->
        json(%{"success" => true, "transactions" => [%{id: "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/transactions/unconfirmed/get", query: [id: "dummy"]} ->
        json(%{"success" => true, "transaction" => %{id: "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/transactions/unconfirmed"} ->
        json(%{"success" => true, "transactions" => [%{id: "dummy"}]})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.One.Transactions.transaction" do
    assert {:ok, response} = transaction(@client, "dummy")
    assert response["transaction"]["id"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Transactions.transactions" do
    assert {:ok,  response} = transactions(@client)
    assert Enum.at(response["transactions"], 0)["id"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Transactions.unconfirmed_transaction" do
    assert {:ok, response} = unconfirmed_transaction(@client, "dummy")
    assert response["transaction"]["id"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Transactions.unconfirmed_transactions" do
    assert {:ok, response} = unconfirmed_transactions(@client)
    assert Enum.at(response["transactions"], 0)["id"] == "dummy"
    assert response["success"] == true
  end

end
