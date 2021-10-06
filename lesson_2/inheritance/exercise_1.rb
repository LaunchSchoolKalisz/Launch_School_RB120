=begin
Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

One problem is that we need to keep track of different breeds of dogs, since they have slightly different 
behaviors. For example, bulldogs can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

=end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

max = Bulldog.new
puts max.speak
puts max.swim

=begin
LS Solution

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

karl = Bulldog.new
puts karl.speak           # => "bark!"
puts karl.swim            # => "can't swim!"

Note that since Bulldog objects are sub-classes of Dog objects, they can both override and inherit methods. 
That is why karl can speak.

=end