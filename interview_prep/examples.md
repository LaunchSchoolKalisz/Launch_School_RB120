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

On `line 82`, we invoke the `describe_shape` instance method on a new `Square` object. Since the `SIDES` constant is referenced within this method without a qualifying namespace, Ruby checks the method lookup path, to see if it defines the constant. Since it finds it, in the superclass `Quadrilateral` Ruby outputs "I am a Square and I have 4 sides".

## Example 4
What is output? Is this what we would expect when using AnimalClass#+? If not, how could we adjust the implementation of AnimalClass#+ to be more in line with what we'd expect the method to return?

```
class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes
```
This code outputs an one array of Animal objects, when the expected output would be an animal class with an animals array as an instance variable. We could adjust the code as such:
```
  def +(other_class)
    combined = AnimalClass.new("Combined Animals")
    combined.animals =  animals + other_class.animals
  end
```
By doing this we are initializing a local variable `combined` to the return value of intantiating an instance of `AnimalClass`. We are invoke the `AnimalClass#animal=(name)` setter method on the object to the set the value of `@animals` instance variable to the return value of the expression `animals + combined.animals` . Since `combined` is the last evaluated expression within the method, the object referenced by `combined` is returned when the `AnimalClass#+` method is invoked.

## Example 5
We expect the code above to output ”Spartacus weighs 45 lbs and is 24 inches tall.” Why does our change_info method not work as expected?
```
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

In the above code, we define an instance method `change_info` that tries to use the `name=`, `height=`, and `weight=` setter methods to reassign the values of each respective variable. However, because we are not using the keyword `self` within the instance method, Ruby assumes that we are instead initializing a local variable name, to which we assign the string object passed as argument.

When we call `change_info` on the GoodDog object `sparky` and pass the strings as arguments, these strings are assigned to local variables within the method and the instance variables remains pointing to their respective strings (ie `name` `height` and `weight` remain pointed to `'Spartacus'`, `'12 inches'`, and `'10 lbs'`). 

We need to use `self` to explicitly call the `name=` setter method in the `change_info` method as below:

```
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w  
end
```

Answer re-do
Within the `change_info` method definition we are not calling the setter methods `name=, height= and weight=` instead we are initializing the local variables `name, height and weight` and setting them to the arguments passed in during the `change_info` method invocation. So, the value referenced by the instance variables are not reassigned. Inorder to fix the issue we will have to call the setter methods using the `self` keyword which represents the current object. This is done as follows.

def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end

Here the `self` keyword references the calling object. Hence the setter methods are invoked with the required parameters are passed in as arguments. `Line 178` now outputs "Spartacus weighs 45 lbs and is 24 inches tall."

## Example 6
In the code above, we hope to output 'BOB' on line 224. Instead, we raise an error. Why? How could we adjust this code to output 'BOB'?
```
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name
```

`line 224` raises an error because within the `change_name` method definition we are not calling the setter method `name=`. Instead, we are initializing the local variable `name` and setting it to the return value of `name.upcase`, which is `nil`. So, the value referenced by the instance variable `@name` is not reassigned. In order to fix this, we will have to call the setter methods using the `self` keyword which represents the current object. This is done as follows.

def change_name
  self.name = name.upcase
end

Here the `self` keyword references the calling object and the setter method is invoked. `Line 224` now outputs "BOB"

Answer re-do
In `line 224` we are invoking the instance method `name` on the instance of the class `Person`. This raises an error. This is because within the method `change_name`, we have the experssion `name = name.upcase` where we are initialializing a new local variable name instead of calling the setter method `#name=`. In order to fix this code we have to call the setter method `name=(argument)` by invoking the setter method on the `self` keyword as `self.name = name.upcase`. This reassign the instance variable `@name` to `"BOB"`.
```
def change_name
  self.name = name.upcase
end
```
After the above modification the `line 16` will output `"BOB"`.

## Example 7
What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?
```
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels 
```

`line 255` outputs 4, and then the rest of the code outputs `2`. This is because on `line 248` we initialize a class variable `@@wheels` and assign it to the integer `4`. On `line 258` we reassign the class variable `@@wheels` to the integer `2`. Just one copy of the class variable exists for the Class and all of its instances. Reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program, and so by reassigning `@@wheels` on `line 258` we also change its value in the superclass `Vehicle` on `line 248`. This behavior is unexpected, and because of this we should avoid working with class variables when working with inheritance.

Answer re-do
Class variables are accessible from within the instance methods. Class variable are defined at the class level and is available to all the instances of the class . Just one copy of the class variable exists for the Class and all of its instances. Hence reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program irreversibly. Due to this reason utilizing class variables can cause unexpected behaviour and due to this Rubyists tend to stay away from it.

Hence we get the following output

`line 9` will output the integer `4` because in `line 2` the class variable `@@wheels` is intialized to the integer `4`

`line 15` will output the integer `2` because in `line 12` the class variable `@@wheels` is reassigned to the integer `2`

the same copy of the class variables remains for the rest of the program hence `lines 15, 16, 20, 21, 22` all output the integer `2`

## Example 8
What is output and why? What does this demonstrate about super?
```
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno
```
`line 303` outputs a GoodDog object, with instance variables `@name="brown"` and `@color="brown"`. `super` is a keyword used in Ruby to invoke a method with the same name within the method lookup path. When we invoke a method which has a `super` keyword, Ruby looks in the method lookup path to find another method with the same name. Ruby invokes the method when it finds it. By default `super` will pass all the arguments passed into the calling method to the other method with the same name, which is why both `@name` and `@color` are assigned to the string `"brown"` in this example. The `super` keyword can also take arguments so if we want to avoid `super` passing all of the arguments passed into the calling method, we can call the `super` keyword with a parenthesis such as `super()`

Answer re-do
`line 17` outputs the object referenced by the local variable `bruno` which is an instance of the `GoodDog` class instantiated on `line 16`. The state of the object has two instance variables `@name` and `@color`. This is because within the constructor method initialize within the `GoodDog` class we have the `super` keyword which looks for the first occurance of the method with the same in the superclasses and invokes it. In this case it invokes the `initialize` method from the `Animal` class and passes all the arguments passed in to the constructor method in the `GoodDog` class. Thereby two instance variables `@name = brown` and `@color = brown` are initialized.

This example demponstrates the following about the `super` keyword:

`Super` is a keyword used by Ruby to invoke a method with the same name within the method lookup path. When we invoke a method which has a `super` keyword, Ruby looks in the method lookup path to find another method with the same name. Ruby invokes the method when it finds it.

The `super` keywords can also take arguments. But by default it will pass all the arguments passed into the calling method to the other method with the same name. In order to avoid this we can call the `super` keyword with a parenthesis such as `super()`.

## Example 9
What is output and why? What does this demonstrate about super?
```
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
```
This code raises an `ArgumentError` because it expecting 0 arguments to `initialize` on `line 320`. When we invoke a method which has a `super` keyword, Ruby looks in the method lookup path to find another method with the same name. Ruby invokes the method when it finds it. By default it will pass all the arguments passed into the calling method to the other method with the same name, and so when we use `super` on `line 326`, Ruby attempts to pass `color` as an argument, resulting in the `ArgumentError`. In order to avoid this we can call the `super` keyword with a parenthesis such as `super()`.

Answer re-do
`Line 13` raises an `ArgumentError` this is because during the instantiation of a new instance of the class `Bear` we are passing in an argument `"black"`. Within the constructor method in the `Bear` class we have a `super` keyword at `line 8`. `Super` keyword looks for a method with the same name in the method lookup path and then invokes it. When `super` keyword is used without parentheses it will pass all the arguments passed to the enclosing method to the method it was looking for. Here the `super` keyword finds a similar method in the `Animal` class which does not take any arguments. Hence when super passes an argument to it an `ArgumentError` is raised. This can be fixed by calling the `super` keyword with a parantheses as follows.
```
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bear = Bear.new("black")  
```
Now the code executes without any error.

## Example 10
What is the method lookup path used when invoking #walk on good_dog?

module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk

The method lookup path is: [GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable]