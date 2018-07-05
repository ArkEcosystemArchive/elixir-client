defmodule ArkEcosystem.Client.API.One.Signatures do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Signatures
  """

  import ArkEcosystem.Client

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkEcosystem.Client.API.One.Signatures.fee(client)
      {:ok, 500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkEcosystem.Client.response()
  def fee(client) do
    client |> get("signatures/fee")
  end
end
