=begin
Add a class method to your MyCar class that calculates the gas mileage of any car.
=end

class MyCar

  def self.gas_mileage(gallons, miles)
    puts "This car gets #{gallons/miles} mpg!" 
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
MyCar.gas_mileage(15, 1)

# LS Solution

class MyCar

  # code omitted for brevity...

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"