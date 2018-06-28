defmodule ArkEcosystem.Client.VoteTest do
  use ExUnit.Case
  import ArkEcosystem.Client.Vote

  @client ArkEcosystem.Client.new(%{
            host: "https://dexplorer.ark.io:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  @tag :skip
  test "call ArkEcosystem.Client.Vote.vote" do
    response =
      vote(
        @client,
        'recipientId',
        '100000000',
        'vendorField'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkEcosystem.Client.Vote.unvote" do
    response =
      unvote(
        @client,
        'recipientId',
        '100000000',
        'vendorField'
      )

    assert(response["success"] === true)
  end
end
