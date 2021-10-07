=begin
Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. 
Truck and Car should both inherit from Vehicle.
=end

module Transportation
end

class Vehicle
  include Transportation
end

class Truck < Vehicle
end

class Car < Vehicle
end