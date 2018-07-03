defmodule ArkEcosystem.Client.API.One.Delegate do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Delegate
  """

  import ArkEcosystem.Client

  @doc """
  Get the count of delegates.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.count(client)
      {:ok, 198}
  """
  @spec count(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def count(client) do
    client |> get("delegates/count")
  end

  @doc """
  Get a single delegate.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.delegate(client)
      {:ok,
       %ArkEcosystem.Client.API.One.Models.Delegate{
         address: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
         approval: 0.09,
         missedblocks: 1748,
         producedblocks: 3473,
         productivity: 66.52,
         public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
         rate: 17,
         username: "arkoar.group",
         vote: "12385839821762"
       }}
  """
  @spec delegate(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def delegate(client, parameters \\ []) do
    client |> get("delegates/get", query: parameters)
  end

  @doc """
  Get all delegates.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.delegates(client)
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Delegate{
           address: "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN",
           approval: 4.32,
           missedblocks: 1722,
           producedblocks: 61445,
           productivity: 97.27,
           public_key: "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d",
           rate: 1,
           username: "boldninja",
           vote: "566475956800532"
         },
         %ArkEcosystem.Client.API.One.Models.Delegate{...},
         %ArkEcosystem.Client.API.One.Models.Delegate{...},
         %ArkEcosystem.Client.API.One.Models.Delegate{...},
         ...
       ]}
  """
  @spec delegates(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def delegates(client, parameters \\ []) do
    client |> get("delegates", query: parameters)
  end

  @doc """
  Get Delegate Fee

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.fee(client)
       {:ok, 2500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fee(client) do
    client |> get("delegates/fee")
  end

  @doc """
  Get the amount of ARKs forged by an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.forged_by_account(client, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec")
      {:ok,
       %{
         "fees" => "190000000",
         "forged" => "695190000000",
         "rewards" => "695000000000",
         "success" => true
       }}
  """
  @spec forged_by_account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def forged_by_account(client, generatorPublicKey) do
    client |> get(
      "delegates/forging/getForgedByAccount",
      query: [generatorPublicKey: generatorPublicKey]
    )
  end

  @doc """
  Get a delegate's forging status

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.forging_status(client, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec")
      {:ok, true}
  """
  @spec forging_status(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def forging_status(client, public_key, parameters \\ []) do
    client |> get(
      "delegates/forging/status",
      query: [publicKey: public_key] ++ parameters
    )
  end

  @doc """
  Get the next forgers.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.next_forgers(client)
      {:ok,
       %{
         "currentBlock" => 3102247,
         "currentSlot" => 4185367,
         "delegates" => ["02845161cfca4d6ddde8e0d53538b6f881fb3ad9383cd77cebc55375dd6fd17663",
          "02ce086b1e1609c691c0d2e0670a15248a7244195798bcc578b12133fe04defe59",
          "033f28ad2e9b897d46f1e67c7c52070e9ca46b04c0679ebb21fb236719e38aade3",
          "031e195f2ba9afcfbea54866b0dac663f568620fb098fdea239f87b4e36c282e44",
          "0200af8a7a8572bcb3fcd305248343358198c8ed5bd004bbacfb16e7f0b09e532b",
          "03794e95585ab18fd95c963cfb2ec24f37ad159f6a43e05dd826577b58a32de309",
          "0326580718fc86ba609799ac95fcd2721af259beb5afa81bfce0ab7d9fe95de991",
          "02a9a0ac34a94f9d27fd9b4b56eb3c565a9a3f61e660f269775fb456f7f3301586",
          "0257b7724e97cd832e0c28533a86da5220656f9b5122141daab20e8526decce01f",
          "035f47535447d5511ba08fc4d805ea662a1f47bfba9204cc9dee77199c6f98a505"],
         "success" => true
       }}
  """
  @spec next_forgers(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def next_forgers(client) do
    client |> get("delegates/getNextForgers")
  end

  @doc """
  Search for specific delegates.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.search(client, "arkoar")
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Delegate{
           address: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
           approval: nil,
           missedblocks: 1748,
           producedblocks: 3476,
           productivity: nil,
           public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
           rate: nil,
           username: "arkoar.group",
           vote: "12385839821762"
         }
       ]}

  """
  @spec search(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkEcosystem.Client.response()
  def search(client, q, parameters \\ []) do
    client |> get("delegates/search", query: [q: q] ++ parameters)
  end

  @doc """
  Get a list of voters for a delegate.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Delegate.voters(client, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec")
      iex(10)> ArkEcosystem.Client.API.One.Delegate.voters(client, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec")
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Account{
           address: "DP8SxqSnCV3Rsdvjeqrum2HA2CAgymCPJP",
           balance: "200000000",
           multisignatures: nil,
           public_key: "023050fa9cea524bb908ffc8836c888ffd1b00d6fb863624c2340f828ac40b4fd1",
           second_public_key: nil,
           second_signature: nil,
           u_multisignatures: nil,
           unconfirmed_balance: nil,
           unconfirmed_signature: nil
         },
         %ArkEcosystem.Client.API.One.Models.Account{...},
         %ArkEcosystem.Client.API.One.Models.Account{...},
         ...
       ]}
  """
  @spec voters(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def voters(client, public_key) do
    client |> get("delegates/voters", query: [publicKey: public_key])
  end
end
