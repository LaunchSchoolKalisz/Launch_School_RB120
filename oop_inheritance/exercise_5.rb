=begin
Move all of the methods from the MyCar class that also pertain to the MyTruck class into the 
Vehicle class. 
Make sure that all of your previous method calls are working when you are finished.
=end

module Offroadable
  "I can drive over rocks"
end

class Vehicle

  attr_accessor :color
  attr_reader :model, :year

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
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

  include Offroadable
end

car = MyCar.new(2011, 'subaru forester', 'white')
car.speed_up(20)
car.current_speed
car.speed_up(20)
car.current_speed
car.brake(5)
car.current_speed
car.shut_down
car.current_speed
MyCar.gas_mileage(15, 100)
car.spray_paint('black')
puts car
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

#LS Solution

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
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

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

my_car = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck = MyTruck.new('2010', 'Ford Truck', 'white')
my_car.speed_up(20)
my_car.current_speed
my_car.speed_up(20)
my_car.current_speed
my_car.brake(20)
my_car.current_speed
my_car.brake(20)
my_car.current_speed
my_car.shut_down

my_truck.spray_paint('red')
puts my_truck.to_s

MyCar.gas_mileage(13, 351)
my_car.spray_paint("red")
puts my_car
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors