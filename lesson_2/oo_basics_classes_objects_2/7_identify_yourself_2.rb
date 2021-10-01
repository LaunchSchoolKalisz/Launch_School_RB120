=begin
Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

Copy Code
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty
Expected output:

Copy Code
I'm Sophie!
=end