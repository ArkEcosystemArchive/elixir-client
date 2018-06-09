defmodule ArkElixirClient.Logger do
  @moduledoc """
  This is a wrapper for the standard Logger module. It contains convenience
  methods for logging exceptions and objects in addition to strings.
  """
  require Logger

  # Contextual

  @doc """
  Converts a rescued error and stacktrace into a pretty error output.

  Returns the error object passed.
  """
  @spec rescued_error(Exception.t(), List.t()) :: Exception.t()
  def rescued_error(err, stacktrace) do
    :error |> Exception.format(err, stacktrace) |> error
    err
  end

  # Generic

  @doc """
  Outputs the object or string in debug mode.

  Returns the object passed.
  """
  @spec debug(any()) :: any()
  def debug(value) when is_bitstring(value) do
    Logger.debug(value)
    value
  end

  def debug(value) do
    value |> pp |> debug
    value
  end

  @doc """
  Outputs the object or string in error mode.

  Returns the object passed.
  """
  @spec error(any()) :: any()
  def error(value) when is_bitstring(value) do
    Logger.error(value)
    value
  end

  def error(value) do
    value |> pp |> error
    value
  end

  @doc """
  Outputs the object or string in info mode.

  Returns the object passed.
  """
  @spec info(any()) :: any()
  def info(value) when is_bitstring(value) do
    Logger.info(value)
    value
  end

  def info(value) do
    value |> pp |> info
    value
  end

  @doc """
  Outputs the object or string in the mode passed mode.

  Returns the object passed.
  """
  @spec log(Atom.t(), any()) :: any()
  def log(:debug, value) do
    debug(value)
  end

  def log(:default, value) do
    info(value)
  end

  def log(:error, value) do
    error(value)
  end

  def log(:info, value) do
    info(value)
  end

  def log(:warn, value) do
    warn(value)
  end

  @doc """
  Outputs the object or string in warn mode.

  Returns the object passed.
  """
  def warn(value) when is_bitstring(value) do
    Logger.warn(value)
    value
  end

  def warn(value) do
    value |> pp |> warn
    value
  end

  # private

  defp pp(value) do
    inspect(value, pretty: true, width: 100)
  end
end
