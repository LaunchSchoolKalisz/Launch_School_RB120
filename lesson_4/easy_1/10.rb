=begin
If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

=end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

p Bag.new('red', 'leather')

=begin
LS Solution

If you tried to create a new instance of the bag by calling Bag.new you would have received an 
error like the one below:

ArgumentError: wrong number of arguments (0 for 2)
  from (irb):in `initialize'
  from (irb):in `new'
This is Ruby telling us that we are missing some arguments and this is totally correct.

As you can see from the initialize method, it is expecting two arguments. So as long as we pass 
in two arguments this error will go away - for example we could call this with 
  Bag.new("green", "paper") and because this is providing the arguments that are needed it will 
  successfully create the instance without an error.
=end
