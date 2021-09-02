=begin
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to 
the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types 
of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the 
MyCar class in some way.

To do
  
  - Create a constant in MyCar which stores specific info about MyCar which makes it different from other vehicles
  - Create a constant in MyTruck which stores specific info about MyTruck which makes it different from other vehicles
=end

class Vehicle
  def self.gas_mileage(gallons, miles)
    puts "This vehicle gets #{miles / gallons} mpg!" 
  end
  
  def to_s
    "My vehicle is a #{@color}, #{@year}, #{@model}"
  end

  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color # can use self.color because we defined the setter method above
    puts "Your new #{color} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_SEATS = 5

end

class MyTruck < Vehicle
  NUMBER_OF_SEATS = 8
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(25)

# LS solution

class Vehicle
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end