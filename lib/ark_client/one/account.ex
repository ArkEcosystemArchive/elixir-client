defmodule ArkClient.One.Account do
  @moduledoc """
  Documentation for ArkClient.One.Account.
  """

  import ArkClient

  alias ArkClient.One.Models.{Account, Delegate}

  @doc """
  Get an account.

  ## Examples

      iex> ArkClient.One.Account.account(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %ArkClient.One.Models.Account{
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
  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.One.response()
  def account(client, address) do
    client
    |> get("api/accounts", query: [address: address])
    |> handle_response
  end

  @doc """
  Get the balance of an account.

  ## Examples

      iex> ArkClient.One.Account.balance(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok,
       %{
         "balance" => "2164627163870",
         "success" => true,
         "unconfirmedBalance" => "2164627163870"
       }}
  """
  @spec balance(Tesla.Client.t(), String.t()) :: ArkClient.One.response()
  def balance(client, address) do
    get(client, "api/accounts/getBalance", query: [address: address])
  end

  @doc """
  Get the delegates of an account.

  ## Examples

      iex> ArkClient.One.Account.delegates(client, "DFAVFGgkpYc4hrvUNZRf9Tpi7irWeKexLc")
      {:ok,
       [
         %ArkClient.One.Models.Delegate{
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
  @spec delegates(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkClient.One.response()
  def delegates(client, address, parameters \\ []) do
    client
    |> get("api/accounts/delegates", query: [address: address] ++ parameters)
    |> handle_response
  end

  @doc """
  Get the delegate fee of an account.

  ## Examples

      iex> ArkClient.One.Account.fee(client)
      {:ok, %{"fee" => 2500000000, "success" => true}}
  """
  @spec fee(Tesla.Client.t()) :: ArkClient.One.response()
  def fee(client) do
    get(client, "api/accounts/delegates/fee")
  end

  @doc """
  Get the public key of an account.

  ## Examples

      iex> ArkClient.One.Account.publickey(client, "DQCZQzibtABoggT9ygSzFNQ3A7PJyxttPP")
      {:ok, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec"}
  """
  @spec publickey(Tesla.Client.t(), String.t()) :: ArkClient.One.response()
  def publickey(client, address) do
    case get(client, "api/accounts/getPublickey", query: [address: address]) do
      {:ok, %{"publicKey" => public_key, "success" => true}} ->
        {:ok, public_key}
      {:ok, invalid_response} ->
        {:error, invalid_response}
      {:error, _error} = response ->
        response
    end
  end

  @doc """
  Get a list of top accounts.

  DEPRECATED
  """
  @spec top(Tesla.Client.t(), Keyword.t()) :: ArkClient.One.response()
  def top(_client, _parameters \\ []) do
    raise "GET /api/accounts/top is deprecated."
  end

  # private

  defp handle_response({:ok, %{"account" => account}}) do
    {:ok, Account.build(account)}
  end

  defp handle_response({:ok, %{"delegates" => delegates}}) do
    {:ok, Enum.map(delegates, &Delegate.build/1)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
