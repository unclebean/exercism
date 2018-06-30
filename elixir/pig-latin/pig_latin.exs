defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @consonant_prefix ~r/^(?<consonant>((ch)|(qu)|(squ)|(th)|(thr)|(sch)|([bcdfghjklmnpqrstvwxyz]))+)(?<others>[a-z]+)/
  @vowel_prefix ~r/^(?<vowel>((yt)|(xr)|([xy][bcdfghjklmnpqrstvwxyz])|([aeiou]))+)(?<others>[a-z]+)/

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase, " ")
    |> Enum.map(&(parseWord(&1)))
    |> Enum.join(" ")
  end

  def parseWord(word) do
    IO.puts(word)
    result = treatWord(Regex.named_captures(@vowel_prefix, word))
    IO.puts(result)
    if result === nil do
      treatWord(Regex.named_captures(@consonant_prefix, word))
    else
      result
    end
  end

  def treatWord(%{"consonant" => prefix, "others" => others}) do
    "#{others}#{prefix}ay"
  end

  def treatWord(%{"vowel" => prefix, "others" => others}) do
    "#{prefix}#{others}ay"
  end

  def treatWord(_) do nil end

end
