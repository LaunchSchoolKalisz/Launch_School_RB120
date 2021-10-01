=begin
Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting 
should include the name and color of the cat. Use a constant to define the color.

kitty = Cat.new('Sophie')
kitty.greet

Expected output:

Hello! My name is Sophie and I'm a purple cat!

=end

class Cat 
  attr_accessor :name
  COLOR = 'purple'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat."
  end
end

kitty = Cat.new('Sophie')
kitty.greet

=begin
LS Solution

class Cat
  COLOR = 'purple'

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

Discussion
The Cat class here is similar to previous exercises. The notable difference is the use of a constant. We use 
a constant in the solution to pre-define a specific color. This constant can be used in all Cat instances.

This makes it easy to print a greeting using a pre-defined color by simply calling the constant with #puts.

=end