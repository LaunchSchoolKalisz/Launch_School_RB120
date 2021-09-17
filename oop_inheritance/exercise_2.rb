=begin
Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. 
Create a method to print out the value of this class variable as well.
=end

class Vehicle

  attr_accessor :color
  attr_reader :year

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(gallons, miles)
    puts "This vehicle gets #{miles / gallons} mpg!" 
  end
  
  def to_s
    "My vehicle is a #{@color}, #{@year}, #{@model}"
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
truck = MyTruck.new(2000, 'suburban', 'blue')
puts lumina.to_s
puts Vehicle.total_number_of_vehicles

# LS Solution

class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  #code omitted for brevity...
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end