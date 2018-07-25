defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """

  def slices(s, size) when size <= 0, do: []

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    String.split(s, "", trim: true)
    |> slices_list(0, size, [])
  end

  def slices_list(_, _, 0, container) do
    container |> Enum.reverse()
  end

  def slices_list(list, start_index, amount, container) do
    val = Enum.slice(list, start_index, amount) |> Enum.join("")
    cond do
      start_index + amount > length(list) -> slices_list(list, start_index, 0, container)
      true -> slices_list(list, start_index + 1, amount, [val | container])
    end
  end

end
