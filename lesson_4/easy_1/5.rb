=begin
Which of these two classes has an instance variable and how do you know?

Copy Code
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
=end