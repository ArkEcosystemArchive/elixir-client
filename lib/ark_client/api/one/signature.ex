defmodule ArkEcosystem.Client.API.One.Signature do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Signature.
  """

  import ArkClient

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Signature.fee(client)
      {:ok, 500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fee(client) do
    client |> get("signatures/fee")
  end
end
