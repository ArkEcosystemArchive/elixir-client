defmodule ArkClient.API.Webhook do
  @moduledoc """
  Documentation for ArkClient.API.One.Transport.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    get(client, "webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def create(client, parameters) do
    post(client, "webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    get(client, "webhooks/#{id}")
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def update(client, id, parameters) do
    put("webhooks/#{id}", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def delete(client, id) do
    delete("webhooks/#{id}")
  end
end
