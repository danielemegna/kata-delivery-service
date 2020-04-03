defmodule DeliveryService do

  def init() do
    []  
  end

  def register_hub(state, hub_name) do
    [%{name: hub_name} | state]
  end

  def register_locker(state, locker_name, box_sizes) do
    [%{name: locker_name, box_sizes: box_sizes} | state]
  end

  def delivery_points_for(state, package_size) do
    state
      |> Enum.filter(fn point -> can_contain(point, package_size) end)
      |> Enum.map(&(&1.name))
  end

  def occupy_box(state, locker_name, _box_size) do
    locker = Enum.find(state, &(&1.name == locker_name))
    List.delete(state, locker)
  end

  defp can_contain(%{box_sizes: box_sizes}, package_size) do
    Enum.any?(box_sizes, fn box_size ->
      box_size >= package_size
    end)
  end

  defp can_contain(_point, _package_size), do: true

end
