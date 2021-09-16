data PowerSource = Petrol | Pedal

data Vehicle : PowerSource -> Type where
  Bicycle : Vehicle Pedal
  Car : (fuel : Nat) -> Vehicle Petrol
  Bus : (fuel : Nat) -> Vehicle Petrol

wheels : Vehicle _ -> Nat
wheels Bicycle = 2
wheels (Car _) = 4
wheels (Bus _) = 4

refuel : Vehicle Petrol -> Vehicle Petrol
refuel (Car _) = Car 100
refuel (Bus _) = Bus 200
refuel Bicycle impossible
