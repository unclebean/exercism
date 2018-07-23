defmodule Bob do
  def hey(input) do
    trimedInput = String.trim(input)
    cond do
      shouldSayChillOut(trimedInput) -> "Whoa, chill out!"
      shouldSayCalmDown(trimedInput) -> "Calm down, I know what I'm doing!"
      shouldSaySure(trimedInput) -> "Sure."
      shouldSayFine(trimedInput) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  def shouldSayChillOut(input) do
    Regex.match?(~r/[^a-z]+!$/, input) or
    Regex.match?(~r/[A-Z\s]+$/, input) or
    Regex.match?(~r/[^\x{0000}-\x{007F}]/, input)
  end
  def shouldSayCalmDown(input) do
    Regex.match?(~r/[A-Z'\s]+\?$/, input)
  end

  def shouldSaySure(input) do
    Regex.match?(~r/[a-z]+\?$/, input) or Regex.match?(~r/[0-9]{1}\?$/, input)
  end

  def shouldSayFine(input) do String.trim(input) === "" end

end
