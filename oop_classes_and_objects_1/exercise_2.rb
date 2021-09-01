=begin
Add an accessor method to your MyCar class to change and view the color of your car. 
Then add an accessor method that allows you to view, but not modify, the year of your car.
=end

class MyCar

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

  def change_color(color)
    @color = color
  end

  def view_color
    puts "Your #{@model} is #{@color}."
  end

  def view_year
    puts "Your #{@model} is from #{@year}."
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.view_color
lumina.change_color('red')
lumina.view_color
lumina.view_year

#LS Solution
class MyCar
  
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

end

lumina.color = 'black'
puts lumina.color
puts lumina.year