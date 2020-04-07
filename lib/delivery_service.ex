defmodule DeliveryService do

  def init() do
    []  
  end

  def register_hub(state, hub_name) do
    [%Hub{name: hub_name} | state]
  end

  def register_locker(state, locker_name, box_sizes) do
    [%Locker{name: locker_name, box_sizes: box_sizes} | state]
  end

  def delivery_points_for(state, package_size) do
    state
      |> Enum.filter(&can_contain(&1, package_size))
      |> Enum.map(&(&1.name))
  end

  def occupy_box(state, locker_name, box_size) do
    locker = get_locker(state, locker_name)
    occupy_locker_box(state, locker, box_size)
  end

  defp occupy_locker_box(state, nil, _box_size), do: state
  defp occupy_locker_box(state, locker, box_size) do
    updated_boxes = List.delete(locker.box_sizes, box_size)
    updated_locker = %{ locker | box_sizes: updated_boxes }
    [updated_locker | List.delete(state, locker)]
  end

  defp get_locker(state, locker_name) do
    Enum.find(state, &(case(&1) do
      %Locker{} = locker -> locker.name == locker_name
      _ -> false
    end))
  end

  defp can_contain(%Hub{}, _package_size), do: true
  defp can_contain(%Locker{} = locker, package_size) do
      Enum.any?(locker.box_sizes, fn box_size ->
        box_size >= package_size
      end)
  end

end

