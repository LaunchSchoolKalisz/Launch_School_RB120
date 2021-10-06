=begin

Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter 
bed_type and implement the modification so that Car continues to only accept one argument.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

Expected output:
1994
Short

=end