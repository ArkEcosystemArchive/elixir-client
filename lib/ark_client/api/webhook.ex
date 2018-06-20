defmodule ArkClient.API.Webhook do
  @moduledoc """
  Documentation for ArkClient.API.One.Transport.
  """

  import ArkClient

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def list(client, parameters \\ []) do
    client |> get("api/webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def create(client, parameters) do
    client |> post("api/webhooks", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def show(client, id) do
    client |> get("api/webhooks/#{id}")
  end

  @spec account(Tesla.Client.t(), List.t()) :: ArkClient.response()
  def update(client, id, parameters) do
    client |> put("api/webhooks/#{id}", parameters)
  end

  @spec account(Tesla.Client.t(), String.t()) :: ArkClient.response()
  def delete(client, id) do
    client |> delete("api/webhooks/#{id}")
  end
end
