defmodule ArkClient do
  @moduledoc """
  Documentation for ArkClient.
  """

  @type response :: {:ok, any} | {:error, any}

  @doc """
  Shortcut to `ArkClient.Client.new/1`
  """
  @spec client(Keyword.t()) :: Tesla.Client.t()
  def client(opts) do
    ArkClient.Client.new(opts)
  end

  @doc """
  Shortcut to `Tesla.get/4`
  """
  @spec get(Tesla.Client.t(), String.t(), Keyword.t()) :: response()
  def get(client, url, opts \\ []) do
    client |> Tesla.get(url, opts) |> handle_response
  end

  @doc """
  Alias for `put/4`
  """
  @spec patch(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def patch(client, url, body, opts \\ []) do
    put(client, url, body, opts)
  end

  @doc """
  Shortcut to `Tesla.post/4`
  """
  @spec post(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def post(client, url, body, opts \\ []) do
    client |> Tesla.post(url, body, opts) |> handle_response
  end

  @doc """
  Shortcut to `Tesla.put/4`
  """
  @spec put(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def put(client, url, body, opts \\ []) do
    client |> Tesla.put(url, body, opts) |> handle_response
  end

  # private

  defp handle_response({:ok, %{body: body, status: code}})
  when is_integer(code) and code >= 200 and code < 300 do
    {:ok, body}
  end

  defp handle_response({:ok, %{body: body}}) do
    {:error, body}
  end

  defp handle_response({:error, response}) do
    {:error, response}
  end
end
