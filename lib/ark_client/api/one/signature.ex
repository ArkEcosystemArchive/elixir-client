defmodule ArkClient.API.One.Signature do
  @moduledoc """
  Documentation for ArkClient.API.One.Signature.
  """

  import ArkClient

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkClient.API.One.Signature.fee(client)
      {:ok, 500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkClient.response()
  def fee(client) do
    client |> get("api/signatures/fee")
  end
end
