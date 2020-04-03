defmodule DeliveryService do

  def init() do
    []  
  end

  def register_hub(state, hub_name) do
    [%{name: hub_name} | state]
  end

  def register_locker(state, locker_name, max_size) do
    [%{name: locker_name, max_size: max_size} | state]
  end

  def delivery_points_for(state, package_size) do
    state
      |> Enum.filter(fn point ->
        !Map.has_key?(point, :max_size) || point.max_size >= package_size
      end)
      |> Enum.map(&(&1.name))
  end

end
