defmodule DeliveryService do

  def init() do
    []  
  end

  def register_hub(_state, hub_name) do
    [hub_name | []]
  end

  def delivery_points_for(state, _size) do
    state
  end

end
