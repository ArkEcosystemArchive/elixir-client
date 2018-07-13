defmodule ArkEcosystem.Client.API.One.Accounts do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Accounts
  """

  import ArkEcosystem.Client

  @doc """
  Get an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.account(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %ArkEcosystem.Client.API.One.Models.Account{
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
  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def account(client, address) do
    client |> get("accounts", query: [address: address])
  end

  @doc """
  Get the balance of an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.balance(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %{
         "balance" => "2164627163870",
         "success" => true,
         "unconfirmedBalance" => "2164627163870"
       }}
  """
  @spec balance(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def balance(client, address) do
    client |> get("accounts/getBalance", query: [address: address])
  end

  @doc """
  Get the delegates of an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.delegates(client, "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc")
      {:ok,
       [
         %ArkEcosystem.Client.API.One.Models.Delegate{
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
  @spec delegates(Tesla.Client.t(), String.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def delegates(client, address, parameters \\ []) do
    client |> get("accounts/delegates", query: [address: address] ++ parameters)
  end

  @doc """
  Get the delegate fee of an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.fee(client)
      {:ok, %{"fee" => 2500000000, "success" => true}}
  """
  @spec fee(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fee(client) do
    client |> get("accounts/delegates/fee")
  end

  @doc """
  Get the public key of an account.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.publickey(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec"}
  """
  @spec publickey(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def publickey(client, address) do
    client |> get("accounts/getPublickey", query: [address: address])
  end

  @doc """
  Get the total amount of accounts.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Accounts.count(client) 
      {:ok,
        %{
          "count" => 841,
          "success" => true
        }}
  """
  @spec count(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def count(client) do
    client |> get("accounts/count")
  end

  @doc """
  Get all accounts

  ## Examples

<<<<<<< HEAD
      iex> ArkEcosystem.Client.API.One.Accounts.all(client, [limit: 30, offset: 10]) 
=======
      iex> ArkEcosystem.Client.API.One.Accounts.all(client) 
>>>>>>> upstream/develop
      // TODO
  """
  @spec all(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def all(client, parameters \\ []) do
    client |> get("accounts/getAllAccounts", query: parameters)
  end

  @doc """
  Get the top accounts

  ## Examples

<<<<<<< HEAD
      iex> ArkEcosystem.Client.API.One.Accounts.top(client, [limit: 30, offset: 10]) 
=======
      iex> ArkEcosystem.Client.API.One.Accounts.top(client) 
>>>>>>> upstream/develop
      {:ok,
       %{
         "accounts" => [
           %{
             "address" => "DGihocTkwDygiFvmg6aG8jThYTic47GzU9",
             "balance" => "11499593562120633",
             "publicKey" => "024c8247388a02ecd1de2a3e3fd5b7c61ecc2797fa3776599d558333ef1802d231"
           },
           ...
          ],
         "success" => true
       }}
  """
  @spec top(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def top(client, parameters \\ []) do
    client |> get("accounts/top", query: parameters)
  end

end
