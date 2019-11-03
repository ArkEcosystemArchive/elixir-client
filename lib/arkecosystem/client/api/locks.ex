defmodule ArkEcosystem.Client.API.Locks do
  @moduledoc """
  Documentation for ArkEcosystem.Client.API.Locks
  """

  import ArkEcosystem.Client

  @spec list(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def list(client, parameters \\ []) do
    client |> get("locks", parameters)
  end

  @spec show(Tesla.Client.t(), String.t()) :: ArkEcosystem.Client.response()
  def show(client, id) do
    client |> get("locks/#{id}")
  end

  @spec search(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def search(client, parameters) do
    client |> post("locks/search", parameters)
  end

  @spec unlocked(Tesla.Client.t(), Keyword.t()) :: ArkEcosystem.Client.response()
  def unlocked(client, parameters) do
    client |> post("locks/unlocked", parameters)
  end
end
