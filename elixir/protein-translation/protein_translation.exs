defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    Enum.chunk_every(String.to_charlist(rna), 3)
    |> Enum.map(&(of_codon(to_string(&1))))
    |> of_result([])
  end

  def of_result([first | tail], result) do
    case first do
      {:error, _} -> {:error, "invalid RNA"}
      {:ok, "STOP"} -> {:ok, result}
      {:ok, v} -> of_result(tail, result++[v])
    end
  end

  def of_result([], result) do
    {:ok, result}
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """


  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    codonMap = %{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP"
    }
    case Map.get(codonMap, codon) do
      x when x != nil -> {:ok, x}
      _ -> {:error, "invalid codon"}
    end
  end
end
