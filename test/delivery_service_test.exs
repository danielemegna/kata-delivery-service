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

  test "occupy not influent locker box" do
    delivery_points = DeliveryService.init()
      |> register_locker("bob", [8, 40])
      |> occupy_box("bob", 8)
      |> delivery_points_for(35)
    assert delivery_points == ["bob"]
  end

  test "hub occupy box attemps are ignored" do
    delivery_points = DeliveryService.init()
      |> register_hub("market46")
      |> occupy_box("market46", 10)
      |> delivery_points_for(50)
    assert delivery_points == ["market46"]
  end

  test "not present locker occupy attemps are ignored" do
    delivery_points = DeliveryService.init()
      |> register_locker("alice", [60])
      |> register_locker("bob", [70])
      |> occupy_box("not-present", 1)
      |> occupy_box("alice", 1)
      |> delivery_points_for(50)
    assert delivery_points == ["alice", "bob"]
  end

  test "first iteration complete example" do
    delivery_points = DeliveryService.init()
      |> register_locker("alice", [10, 60])
      |> register_locker("bob", [8, 70])
      |> register_hub("market46")
      |> occupy_box("bob", 70)
      |> occupy_box("alice", 10)
      |> delivery_points_for(50)
    assert delivery_points == ["alice", "market46"]
  end



end
