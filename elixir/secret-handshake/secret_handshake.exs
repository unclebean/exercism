defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    action = %{1 => "wink", 10 => "double blink", 100 => "close your eyes", 1000 => "jump", 10000 => "Reverse the order of the operations in the secret handshake"}
    deciamlAction = Enum.map(action, fn {key, value} ->
      stringKey = Integer.to_string(key)
      decimalKey = Integer.undigits(Enum.map(String.split(stringKey, "", trim: true), fn(m)-> String.to_integer(m) end), 2)
      {decimalKey, value}
    end)

    Enum.reduce(deciamlAction, [], fn(ele, acc) -> 
      key = elem(ele, 0)
      if (code &&& key) == key do
        case key do 
          16 -> Enum.reverse(acc) 
          _  -> acc ++ [elem(ele, 1)]
        end
      else
        acc
      end
    end)
  end

end
