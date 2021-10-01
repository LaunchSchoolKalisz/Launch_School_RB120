=begin
Using the following code, add a method named #identify that returns its calling object.

Copy Code
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
Expected output (yours may contain a different object id):

Copy Code
#<Cat:0x007ffcea0661b8 @name="Sophie">
=end