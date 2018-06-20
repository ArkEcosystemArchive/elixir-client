defmodule ArkClient.API.Two.Account do
  @moduledoc """
  Documentation for ArkClient.API.One.Account.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("votes", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("votes/#{id}")
  end
end
