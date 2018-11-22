defmodule ArkEcosystem.Client.One.BlocksTest do
  use ExUnit.Case
  import ArkEcosystem.Client.API.One.Blocks
  import Tesla.Mock

  @client ArkEcosystem.Client.new(%{
            host: "http://127.0.0.1:8443/api",
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1"
          })

  setup do
    mock fn
      #%{method: :get, url: "http://127.0.0.1:8443/api/blocks/get", query: [id: "dummy"]} ->
      #  json(%{"success" => true, "block" => %{"id" = "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks"} ->
        json(%{"success" => true, "blocks" => [%{id: "dummy"}]})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/get"} ->
        json(%{"success" => true, "block" => %{id: "dummy"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getEpoch"} ->
        json(%{"success" => true, "epoch" => "dummy::TimeZ"})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getHeight"} ->
        json(%{"success" => true, "height" => "dummyHeight"})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getNethash"} ->
        json(%{"success" => true, "nethash" => "dummyHash"})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getFee"} ->
        json(%{"success" => true, "fee" => "dummyFee"})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getFees"} ->
        json(%{"success" => true, "fees" => %{send: "dummyFee"}})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getMilestone"} ->
        json(%{"success" => true, "milestone" => 1})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getReward"} ->
        json(%{"success" => true, "reward" => 1})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getSupply"} ->
        json(%{"success" => true, "supply" => 42})
      %{method: :get, url: "http://127.0.0.1:8443/api/blocks/getStatus"} ->
        json(%{"success" => true, "epoch" => "dummy::TimeZ", supply: 42})
    end
    :ok
  end

  test "call ArkEcosystem.Client.API.One.Blocks.block" do
    assert {:ok, response} = block(@client, "dummy")
    assert response["block"]["id"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.blocks" do
    assert {:ok, response} = blocks(@client)
    assert Enum.at(response["blocks"], 0)["id"] == "dummy"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.epoch" do
    assert {:ok, response} = epoch(@client)
    assert response["epoch"] == "dummy::TimeZ"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.height" do
    assert {:ok, response} = height(@client)
    assert response["height"] == "dummyHeight"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.nethash" do
    assert {:ok, response} = nethash(@client)
    assert response["nethash"] == "dummyHash"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.fee" do
    assert {:ok, response} = fee(@client)
    assert response["fee"] == "dummyFee"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.fees" do
    assert {:ok, response} = fees(@client)
    assert response["fees"]["send"] == "dummyFee"
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.milestone" do
    assert {:ok, response} = milestone(@client)
    assert response["milestone"] == 1
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.reward" do
    assert {:ok, response} = reward(@client)
    assert response["reward"] == 1
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.supply" do
    assert {:ok, response} = supply(@client)
    assert response["supply"] == 42
    assert response["success"] == true
  end

  test "call ArkEcosystem.Client.API.One.Blocks.status" do
    assert {:ok, response} = status(@client)
    assert response["epoch"] == "dummy::TimeZ"
    assert response["supply"] == 42
    assert response["success"] == true
  end
end
