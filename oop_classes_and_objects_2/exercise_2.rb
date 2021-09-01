=begin
Override the to_s method to create a user friendly print out of your object.
=end

class MyCar

  def self.gas_mileage(gallons, miles)
    puts "This car gets #{miles / gallons} mpg!" 
  end
  
  def to_s
    "My car is a #{@color}, #{@year}, #{@model}"
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

lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina
MyCar.gas_mileage(1, 15)

#LS Solution

class MyCar
  # code omitted for brevity...

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.

## Note the "puts" calls "to_s" automatically.