=begin
Write a method called age that calls a private method to calculate the age of the vehicle. 
Make sure the private method is not available from outside of the class. You'll need to use 
Ruby's built-in Time class to help.
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

  def age
    "This car is #{years_old} years old."
  end
  
  private
  def years_old
    current_time = Time::now
    current_year = current_time.year
    car_year = @year
    car_age = current_year - car_year
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
p car.age