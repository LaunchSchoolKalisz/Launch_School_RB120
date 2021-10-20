=begin
Which of these two classes has an instance variable and how do you know?

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

Pizza has an instance variable - defined by @name

LS Solution

You can find out if an object has instance variables by either looking at the class or asking the 
object. First, lets look at the class definitions.

You might have noticed in the Pizza class there is a variable where the variable name starts with 
an @ symbol. This means that this class has an instance variable.

But let us be triple sure that only Pizza has an instance variable by asking our objects if they 
have instance variables.

To do this we first need to create a Pizza object and a Fruit object.

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")
Now we can ask each of these objects if they have instance variables.

>> hot_pizza.instance_variables
=> [:@name]
>> orange.instance_variables
=> []

As you can see, if we call the instance_variables method on the instance of the class we will be 
informed if the object has any instance variables and what they are.

By doing this we have found out that Pizza has instance variables while Fruit does not.
=end