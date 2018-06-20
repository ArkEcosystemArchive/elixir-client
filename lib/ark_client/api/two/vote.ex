defmodule ArkClient.API.Two.Account do
  @moduledoc """
  Documentation for ArkClient.API.One.Account.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    get(client, "votes", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    get(client, "votes/#{id}")
  end
end
