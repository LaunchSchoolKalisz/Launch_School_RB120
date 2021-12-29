## Example 1
```
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
```

What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

This code outputs `nil`. This is because the instance variable name is not initialized correctly. `attr_reader` is read only. `set_name` could be a writer method, but would be called by `bob.set_name`, and so when we try to access it with `bob.name` it is still considered uninitialized. Uninitialized instance variables always return `nil` when we try to access them through the getter method. When we try to access an uninitialised local variable it will raise an error.

Answer re-do
This code outputs `nil`. On `line 11` a new object `bob` is initialized by calling the `::new` method on the class `Person`. Within the method we have getter method `name` initialized by the method accessor `attr_reader` and an instance method `set_name`. There are no instance variables defined within `Person` and so `line 12` outputs `nil` when we attempt to invoke `name` on the variable `bob`. This is because we are trying to access an uninitialized instance variable. Uninitialized instance variables always return `nil` when we try to access them through a getter method while an uninitialized local variable would raise an error. The state of the object is encapsulated by the instance variables. The state of an object is the colllection of all of its instance variables and the values it references. Instance methods can access instance variables. Instance variables exists as long as the object exists. Once the Object is destroyed then the instance variable perishes along with it.

## Example 2
What is output and why? What does this demonstrate about instance variables?

```
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```

This code outputs `nil`. On `line 40` a local variable `teddy` is instantiated to a new object by calling the `::new` class method on the class `Dog`. There are no instance variables defined within `Dog` and so `line 41` outputs `nil` when we attempt to invoke `swim` on the variable `teddy`, even with the `Swimmable` module mixed in. This is because we are trying to access an uninitialized instance variable. Uninitialized instance variables always return `nil` when we try to access them through a getter method while an uninitialized local variable would raise an error. The state of the object is encapsulated by the instance variables. The state of an object is the colllection of all of its instance variables and the values it references. Instance methods can access instance variables. Instance variables exists as long as the object exists. Once the Object is destroyed then the instance variable perishes along with it.

Answer re-do
In Ruby uninitialized instance variables always return `nil` when we try to access them through a getter method. When we try to access an uninitialised local variable it will raise an error.

In `line 40` a local variable `teddy` is instantiated to a new object by calling the `::new class` method on the class `Dog`. There are no instance variables defined within `Dog` and so `line 41` outputs `nil` when we attempt to invoke `swim` on the variable `teddy`, even with the `Swimmable` module mixed in. This is because we are trying to access an uninitialized instance variable.

## Example 3

What is output and why? What does this demonstrate about constant scope? What does self refer to in each of the 3 methods above?

```
module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides # 4
p Square.new.sides # 4
p Square.new.describe_shape # 4
```
This code outputs `4`, then `4`, then `"I am a Square and I have 4 sides"`. 

This demonstrate that constants have a lexical scope. When Ruby looks for a constant, it first looks for the constant in the class which references it and then looks up the inheritance hierarchy when it cannot find it. 

On `line 58` `self` refers to whatever class is discribed

Answer re-do
When Ruby looks for a constant it first looks for the constant in the class which references it and then looks up the inheritance hierarchy when it cannot find it. This is because the constants in Ruby have a lexical scope.

On `line 80` we are invoking the class method `sides` on the class `Square` this will print the integer `4`. This is because Ruby first looks for the class method in the method lookup path of the `Square` class eventually finding it in the `Shape` class and then resolves the expression `self::SIDES` which is the same as `Square::SIDES`. Ruby looks for `SIDES` in the method lookup path and finds it in the `Quadilateral` class.

On `line 81` the `sides` instance method is called on the new instance of the `Square` which, again, outputs the integer `4`. Ruby looks for the method in the method lookup path and finds the `sides` instance method in the `Shape` class. The last expression within the method is `self.class::SIDES` which equates to `Square.new.class::SIDES`. As before the value referenced by `SIDES` is 4.

On `line 82`, we invoke the `describe_shape` instance method on a new `Square` object. Since the `SIDES` constant is referenced within this method without a qualifying namespace, Ruby checks the superclass enclosing module - the `Describable` module, to see if it defines the constant. Since it doesn't find it, Ruby raises a NameError error. Within the describe_shape method, self refers to the Square object.