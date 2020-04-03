defmodule DeliveryServiceTest do
  use ExUnit.Case

  import DeliveryService

  test "no delivery point" do
    delivery_points = DeliveryService.init()
      |> delivery_points_for(50)
    assert delivery_points == []
  end

  test "single available hub" do
    delivery_points = DeliveryService.init()
      |> register_hub("market46")
      |> delivery_points_for(50)
    assert delivery_points == ["market46"]
  end

end
