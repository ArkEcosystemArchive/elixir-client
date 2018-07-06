defmodule ArkEcosystem.Client.API.One.TransactionsTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Transactions

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  test "call ArkEcosystem.Client.API.One.Transactions.transaction" do
    response =
      transaction(@client, "dfa5a992f392daf01e3db43e49799010ef13b107c592e9044ced99f7df3f81c9")

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Transactions.transactions" do
    response = transactions(@client)

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Transactions.unconfirmed_transaction" do
    response =
      unconfirmed_transaction(
        @client,
        "dfa5a992f392daf01e3db43e49799010ef13b107c592e9044ced99f7df3f81c9"
      )

    assert({:ok, _} = response)
  end

  test "call ArkEcosystem.Client.API.One.Transactions.unconfirmed_transactions" do
    response = unconfirmed_transactions(@client)

    assert({:ok, _} = response)
  end

end