defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @alphabet "abcdefghijklmnopqrstuvwxyz"

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    IO.puts(cipherWithShift(shift))
    cipherStr = cipherWithShift(shift)
    alphabetList = String.to_charlist(@alphabet)
    String.to_charlist(text)
    |> Enum.map(fn(c) -> Enum.find_index(alphabetList, &(&1 == c)) end)
    |> Enum.filter(&(&1 != nil))
    |> Enum.map(&(String.at(cipherStr, &1)))
    |> Enum.join("")
  end

  @spec cipherWithShift(shift :: integer) :: String.t()
  def cipherWithShift(shift) do
    String.slice(@alphabet, shift..26) <> String.slice(@alphabet, 0..shift-1)
  end

end
