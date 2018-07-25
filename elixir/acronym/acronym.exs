defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r/\W/, trim: true)
    |> Enum.map(&extract_upcase/1)
    |> Enum.join("")
    |> String.upcase()
  end

  def extract_upcase(string) do
    first = String.first(string)
    first <> (string |> String.replace(~r/^([a-zA-Z]{1})/, "") |> String.replace(~r/([a-z]?)/, ""))
  end
end
