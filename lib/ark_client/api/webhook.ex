defmodule ArkClient.API.Webhook do
  @moduledoc """
  Documentation for ArkClient.API.One.Transport.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def create(client, parameters) do
    client |> post("webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("webhooks/#{id}")
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def update(client, id, parameters) do
    client |> put("webhooks/#{id}", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def delete(client, id) do
    client |> delete("webhooks/#{id}")
  end
end
