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

  test "multiple available hubs" do
    delivery_points = DeliveryService.init()
      |> register_hub("market46")
      |> register_hub("gas-station")
      |> delivery_points_for(50)
    assert delivery_points == ["gas-station", "market46"]
  end

  test "single locker big enough" do
    delivery_points = DeliveryService.init()
      |> register_locker("evia", [80])
      |> delivery_points_for(50)
    assert delivery_points == ["evia"]
  end

  test "single little locker" do
    delivery_points = DeliveryService.init()
      |> register_locker("lisa", [1])
      |> delivery_points_for(50)
    assert delivery_points == []
  end

  test "multiple lockers" do
    delivery_points = DeliveryService.init()
      |> register_locker("lisa", [1])
      |> register_locker("evia", [50])
      |> delivery_points_for(50)
    assert delivery_points == ["evia"]
  end

  test "lockers with multiple boxes" do
    delivery_points = DeliveryService.init()
      |> register_locker("alice", [10, 60])
      |> register_locker("bob", [8, 40])
      |> delivery_points_for(50)
    assert delivery_points == ["alice"]
  end

  test "occupy locker box small enough" do
    delivery_points = DeliveryService.init()
      |> register_locker("alice", [10, 60])
      |> occupy_box("alice", 60)
      |> delivery_points_for(50)
    assert delivery_points == []
  end

  # occupied locker
  # hub and locker mixed example

end
