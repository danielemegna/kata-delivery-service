defmodule DeliveryService do

  def init() do
    []  
  end

  def register_hub(state, hub_name) do
    [hub_name | state]
  end

  def delivery_points_for(state, _size) do
    state
  end

end
