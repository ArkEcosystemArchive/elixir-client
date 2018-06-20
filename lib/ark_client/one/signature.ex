defmodule ArkClient.One.Signature do
  @moduledoc """
  Documentation for ArkClient.One.Signature.
  """

  import ArkClient

  @doc """
  Create a new signature.

  DEPRECATED
  """
  @spec create(Tesla.Client.t(), String.t(), String.t()) :: ArkClient.One.response()
  def create(_client, _secret, _second_secret) do
    raise "POST /api/signatures is deprecated."
  end

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkClient.One.Signature.fee(client)
      {:ok, 500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkClient.One.response()
  def fee(client) do
    client
    |> get("api/signatures/fee")
    |> case do
      {:ok, %{"fee" => fee, "success" => true}} -> {:ok, fee}
      {:ok, invalid_response} -> {:error, invalid_response}
      {:error, _message} = error -> error
    end
  end
end
