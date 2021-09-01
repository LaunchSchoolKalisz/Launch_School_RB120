=begin
Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance 
variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of 
the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the 
car off.
=end

class MyCar
  attr_accessor :car_name, :year, :color, :model, :current_speed

  def initialize(car_name, current_speed)
    @car_name = car_name
    @current_speed = 0
  end

  def current_speed
    if @current_speed == false
      puts "#{@car_name} is off"
    else
      puts "#{@car_name} is driving #{@current_speed} mph"
    end
  end

  def speed_up
    @current_speed += 5
  end

  def brake
    @current_speed = 0
  end

  def shut_off
    @current_speed = false
  end

  def car_info(car_name, year, color, model)
    "#{self.car_name} is a #{year} #{color} #{model}."
  end
end

wednesday = MyCar.new('Wednesday', 0)
puts wednesday.car_info(wednesday, '2017', 'black', 'legacy')
puts wednesday.current_speed
wednesday.speed_up
puts wednesday.current_speed
wednesday.brake
puts wednesday.current_speed
wednesday.shut_off
puts wednesday.current_speed