defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/^\s+$|^$/, input)  -> "Fine. Be that way!"
      Regex.match?(~r/[A-Z\s']+\?$/, input) -> "Calm down, I know what I'm doing!"
      Regex.match?(~r/[A-Z\s%^*@#$()!0-9]+[^a-z]\!$/, input) -> "Whoa, chill out!"
      Regex.match?(~r/[A-Z\s]+$/, input) -> "Whoa, chill out!"
      Regex.match?(~r/[^\x{0000}-\x{007F}]/, input) -> "Whoa, chill out!"
      Regex.match?(~r/^[A-Z]+[\sa-z]+\?$/, input) -> "Sure."
      Regex.match?(~r/^[0-9]+\?$/, input) -> "Sure."
      Regex.match?(~r/^[A-Z]*.+[.!]*$/, input) -> "Whatever."
    end
  end
end
