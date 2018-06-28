defmodule ArkEcosystem.Client.API.Two.Account do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Account.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("votes", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("votes/#{id}")
  end
end
