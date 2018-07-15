defmodule ArkEcosystem.Client.API.Two.Vote do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.One.Vote
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("votes", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("votes/#{id}")
  end
end
