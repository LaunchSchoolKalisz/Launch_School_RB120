=begin
If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the 
ability for them to go_fast using the module Speed? How can you check if your Car or Truck can 
now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

p Car.new.go_fast
p Truck.new.go_fast

=begin
In order to give the go_fast method to the Truck and the Car we need to include the module that 
has that method. To do this we need to add include Speed to each of the classes, like this:

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end
Now that everything looks right, how do we confirm that our Truck and Car can actually go_fast? 
The answer is to try it:

irb :001 > blue_truck = Truck.new
irb :002 > blue_truck.go_fast
I am a Truck and going super fast!

irb :003 > small_car = Car.new
irb :004 > small_car.go_fast
I am a Car and going super fast!

As you can see we can now go fast in our Car and Truck.
=end