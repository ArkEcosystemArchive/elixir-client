defmodule ArkClient.API.One.Account do
  @moduledoc """
  Documentation for ArkClient.API.One.Account.
  """

  import ArkClient

  @doc """
  Get an account.

  ## Examples

      iex> ArkClient.API.One.Account.account(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %ArkClient.API.One.Models.Account{
         address: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
         balance: "2164427163870",
         multisignatures: [],
         public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
         second_public_key: nil,
         second_signature: 0,
         u_multisignatures: [],
         unconfirmed_balance: "2164427163870",
         unconfirmed_signature: 0
       }}
  """
  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def account(client, address) do
    client |> get("accounts", query: [address: address])
  end

  @doc """
  Get the balance of an account.

  ## Examples

      iex> ArkClient.API.One.Account.balance(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %{
         "balance" => "2164627163870",
         "success" => true,
         "unconfirmedBalance" => "2164627163870"
       }}
  """
  @spec balance(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def balance(client, address) do
    client |> get("accounts/getBalance", query: [address: address])
  end

  @doc """
  Get the delegates of an account.

  ## Examples

      iex> ArkClient.API.One.Account.delegates(client, "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc")
      {:ok,
       [
         %ArkClient.API.One.Models.Delegate{
           address: "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP",
           approval: 0.09,
           missedblocks: 1748,
           producedblocks: 3469,
           productivity: 66.49,
           public_key: "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec",
           rate: 17,
           username: "arkoar.group",
           vote: "12385839821762"
         }
       ]}
  """
  @spec delegates(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkClient.response()
  def delegates(client, address, parameters \\ []) do
    client |> get("accounts/delegates", query: [address: address] ++ parameters)
  end

  @doc """
  Get the delegate fee of an account.

  ## Examples

      iex> ArkClient.API.One.Account.fee(client)
      {:ok, %{"fee" => 2500000000, "success" => true}}
  """
  @spec fee(Tesla.Client.t()) :: ArkClient.response()
  def fee(client) do
    client |> get("accounts/delegates/fee")
  end

  @doc """
  Get the public key of an account.

  ## Examples

      iex> ArkClient.API.One.Account.publickey(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec"}
  """
  @spec publickey(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def publickey(client, address) do
    client |> get("accounts/getPublickey", query: [address: address])
  end
end
