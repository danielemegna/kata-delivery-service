defmodule Locker do
  @enforce_keys [:name, :box_sizes]
  defstruct @enforce_keys
end
