=begin
You want to create a nice interface that allows you to accurately describe the action you want your program to perform. 
Create a method called spray_paint that can be called on an object and will modify the color of the car.
=end

class MyCar

  attr_accessor :color # gives access to getter and setter methods
  attr_reader :year # gives access to getter methods only
  
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

end

lumina = MyCar.new(1997, 'chevy lumina', 'white')