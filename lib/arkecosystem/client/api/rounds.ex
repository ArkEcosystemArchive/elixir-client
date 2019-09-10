defmodule ArkEcosystem.Client.API.Rounds do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Rounds
  """

  import ArkEcosystem.Client

  @spec delegates(Tesla.Client.t(), integer) :: ArkEcosystem.Client.response()
  def delegates(client, id) do
    client |> get("rounds/#{id}/delegates")
  end
end
