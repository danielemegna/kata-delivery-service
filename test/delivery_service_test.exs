defmodule DeliveryServiceTest do
  use ExUnit.Case

  test "no delivery point" do
    delivery_points = DeliveryService.delivery_points_for(50)
    assert delivery_points == []
  end
end
