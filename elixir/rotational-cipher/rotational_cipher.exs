defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(fn(c) -> getChar(c, shift) end)
    |> List.to_string()
  end

  def getChar(charVal, shift) do 
    case charVal do
      charVal when charVal in 97..122 -> Enum.at(getAlephabetIndex(97, 122, shift), charVal-97)
      charVal when charVal in 65..90  -> Enum.at(getAlephabetIndex(65, 90, shift), charVal-65)
      charVal -> charVal
    end
  end

  def getAlephabetIndex(startChar, endChar, shift) do
    splitIndex = startChar + rem(shift, 26)
    Enum.to_list(splitIndex..endChar) ++ if splitIndex-1 <= 0, do: [], else: Enum.to_list(startChar..splitIndex-1)
  end

end
