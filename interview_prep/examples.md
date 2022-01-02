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

## Example 11
What is output and why? How does this code demonstrate polymorphism?
```
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end
```
This code outputs: `I eat. I eat plankton. I eat kibble.`
This demonstrates polymorphism through inheritance. We define a more general eats method in the superclass Animal that is available to to all Animal objects. In the `Fish` subclass, we override this method to implement a process that's more specific to the `Fish` type. Similarly, in the `Dog` subclass, we override `Animal#eats` for a more specific implementation. Because we have defined more specific types of eats, we can work with all the different types of objects in the same way, even though the implementations may be different. This is shown when we create three objects one from the `Animal`class, the `Fish`class, and the `Dog` class, and place them together in an array. We are able to iterate over each object in the array and pass them into the `feed_animal` method, eventually invoking the `eats` method on all of them despite the fact that they are all objects of a different type.

This example of is the essence of accessing different implementations through a common interface (in this case, the client code `eats`). When we call `eats` on an instance of the `Animal` class, the `Animal#eats `method is invoked, and we see the appropriate output `'I eat'`. When we call `eats` on an instance of the `Fish` class, the `Fish#eats `method is invoked, and we see the appropriate output `'I eat plankton'`. Finally, we invoke `eats` on an instance of the `Dog` class, the `Dog#eats `method is invoked, and we see the appropriate output `'I eat kibble'`.

The above code works because the block `animal.eats` only really cares that each element in the array has an `eats` method that is called with no arguments, which is the case here. The interface (`eats`) is the same for all the objects, despite their different implementations.

Answer re-do
This code outputs, `"I eat"`, `"I eat plankton."`, and `"I eat kibble."`

This is an example of polymporhism through inheritance in which objects of different types can respond to the same method invocation simply by overriding a method from the superclass.

In this example we define a `Animal` class with a `eat` method. We also define a `Fish` class and `Dog` class that both subclass from `Animal` where they override the `eat` method that they inherit, and implement their own specialized verson of this method.

Even though every object in the `array_of_animals` array is a different object type, each with their own implementation of the `eat` method, the client code only cares that the objects can respond to the same `eat` method invocation.

## Example 12
We raise an error in the code above. Why? What do kitty and bud represent in relation to our Person object?
```
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump
```
This code raises a `NoMethodError` because we are attempting to call `jump` on an array of objects. On `line 473` we initialize a `Person` object referenced by the local variable `bob` whose state has 2 instance variables `@name` and `@pets`. On `line 475` and `line 476` we initialize a `Cat` and `Bulldog` object respectively, referenced by the local variables `kitty` and `bud`. Both `Cat` and `Bulldog` inherit from the superclass `Pet`. On `line 478` and `line 478` we use the shovel operator to add the `kitty` and `bud` objects into the `@pets` instance variable. So, when we attempt to call `jump` on `bob.pets` on line `481`, we are attempting to call `jump` on an instance of the `Person` class, however `jump` is a method of the `Pet` class, hence the `NoMethodError`.

Answer re-do
On `line 28` the `pets` getter method returns an `Array` object with elements as the objects of the `Cat` and `Bulldog` class. Since `Array` class does not have a `jump` instance method defined we get an error when we call the `jump` method on the return value of the `pets` getter method being called on the object referenced by `bob`. In order to fix this issue we will have to call the `jump` instance method on each if the elements of the array as follows

`bob.pets.each {|pet| pet.jump}`
now the code executes properly and outputs `"I'm jumping!"` and `"I'm jumping!"` on two seperate lines.

## Example 13
What is output and why?
```
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name
```
The output from `line 509` is `"bark! bark!  bark! bark!"`. This is because of the `Dog`'s class `initialize` method on line `501`. The `Dog` class inherits from the superclass `Animal` but then overrides `Animal`'s intitialize method with its own. However, `Dog`'s initialize method does not instantiate any intstance variables and therefore returns nil, which is why we see the output above. Uninitialized instance variables always return `nil` when we try to access them through a getter method. We can either delete the `initialize` method from the `Dog` class, allowing `Dog` to inherit the `initialize` method from its superclass `Animal`, or, we can use the keyword super:
```
def initialize(name) 
  super
end
```

Answer re-do
Uninitialized instance variables always return `nil` when we try to access them through a getter method.

In the above example within the `Dog` class there is a constructor method initialize which overrides the constructor method from the `Animal` class. Within the method definiton of the initialize method in `line 501` there are no instance variables defined. Uninitialized instance variables always return `nil` when we try to access them. In `line 509` the `dog_name` instance method is called on the object referenced by the local variable `teddy`. Within the method definition of `dog_name` from `line 503 - 505` we are trying to interpolate an uninitialised instance variable `@name` this will evaluate to an empty string `""` as `nil` evaluates to an empty string when interpolated. Due to this the expression in `line 509` outputs `"bark! bark!  bark! bark!"`

## Example 14
In the code above, we want to compare whether the two objects have the same name. Line 11 currently returns false. How could we return true on line 11? 

Further, since al.name == alex.name returns true, does this mean the String objects referenced by al and alex's @name instance variables are the same object? How could we prove our case?

```
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```
`line 539` currently returns `false` because we are comparing the two objects themselves, not their names. In order to compare the names have have `line 539` return true, we can change the code to the following:
`al.name == alex.name`
However, the String objects referenced by al and alex's @name instance variables are not the same object, as demonstrated if we use the `#object_id` method to compare the two strings:
p al.name.object_id # returns 60
p alex.name.object_id # returns 80

Answer re-do
The `line 11` currently outputs `false` because it is comparing two objects of the same class. Each objects are unique though they may have the same state.

In order to make `line 11` output `true` we can modify the code as follows by providing a custom `#==` instance method as follows:
```
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```
Now in line 15 we are comparing the states of the two objects which have the same value and hence it returns true.

since `al.name == alex.name` returns true, This does not mean the String objects referenced by al and alex's `@name` instance variables are the same object. Though they are objects of the same class they are two different objects in memory space. This can be proved by calling the `object_id` method on them as follows
```
p al.name.object_id
p alex.name.object_id
```
we notice that they both have different object id's.

## Example 15
What is output on `lines 593, 594, and 595` and why?
```
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
```
The output of the code from `lines 593-595` is: 
```
Bob
My name is BOB.
BOB
```
On `line 592`, we assign local variable `bob` to the object created by calling the `::new` class method on the `Person` class. The `#initialize` method initializes a new `Person` object, which it does by assigning the instance variable `@name` to the person's name specified by the argument.
`line 593` outputs the instance variable assigned to local variable `bob`, hence printing `"Bob"`. On the next line, `line 594`, `puts` works by calling `#to_s` to convert the code to a string so that it can output the code, and so the `to_s` method is called on the person object that was created on `line 192` which returns the string `"My name is #{name.upcase!}."`. The `upcase!` method modifies the string that it is called on, and so the string assigned to the instance variable `name` is modified to `BOB`, hence the output. On `line 595`, we output instance variable assigned to local variable `bob`, hence printing the manipulated `"BOB"`.

Answer re-do
On `line 13` a local variable `bob` is initialized to the instance of the `Person` object by calling the `::new` class method on it. The `::new` method takes an argument String `"Bob"`. This is then assigned to the instance variable `@name`.On `lines 8 - 10` a custom `to_s` instance method is defined and within the method definition we have an expression `name.upcase!`. Here we are invoking the getter method `name` and calling a destructive method `upcase!` on it which will permanently modify the object referenced by `@name`. Also `puts` method invocation by default invokes the `to_s` method on the arguments passed to it. Hence on `line 15` the `to_s` custom instance method is invoked and it prints out `"My name is BOB."`. Now the value refereneced by `@name` is modified permanently. Hence `line 16` prints `"BOB"`. If we dont want this behaviour then we can call a non destructive method as follows

```
def to_s
  "My name is #{name.upcase}."
end
```
## Example 16
Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.
```
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def >(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

bob = Student.new("Bob", 80)
riaz = Student.new("Riaz", 90)
p riaz > bob # => true
p riaz.grade # => NoMethodError
```
It is better to invoke a setter method because the getter/setter methods are much easier to reference if we ever need to retrieve or modify the state of the object as we can make changes in just one place. In addition, it will be easier to make the methods private or protected if necessary and encapsulate the code

```
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name
```
It is safer to invoke a setter method than to explicitly call an instance variable because we can expose sensitve data or might accidentaly modify the value it references.

```
class Student

  def initialize(name, score)
    @name = name
    @score = score
  end

  def get_grades
    puts "#{name} has the grade #{finding_rank}"
  end

  private
  attr_reader :name, :score

  def finding_rank
    answer = case score
              when 85..100 then "Merit"
              when 80..84 then "Distinction"
              when 59..79 then "Pass"
              else
                "Fail"
             end
    answer            
  end

end

bob = Student.new("Bob", 85)
bob.get_grades
```
here we are encapsulating the score attained by the student and instead we are just showing the desired output

## Example 17 - custom setter method
Give an example of when it would make sense to manually write a custom getter method vs. using attr_reader.

It would make sense to manually write a custom getter method if you want a getter method to say something specific.
```
class Person
  def initialize(name)
    @name = name
  end

  def name
    puts "Hi, my name is #{@name}"
  end
end

marts = Person.new("Martha")
marts.name
```

Answer re-do
Give an example of when it would make sense to manually write a custom getter method vs. using attr_reader.
```
class Student
  def initialize(name)
    @name = name
  end

  def name
    puts "Hi my name is #{@name.capitalize}"
  end
end

Student.new("martha").name
```
Creating a getter method using the attr_reader can be an easier way of defining setter methods. How ever if you want to manipulate the return value of the getter method or influence what it does then we will have to define a custom getter method. This will give us the added flexibility required. In the above example calling the getter method name will output "Hi my name is Martha".

## Example 18
What can executing Triangle.sides return? What can executing Triangle.new.sides return? What does this demonstrate about class variables
```
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

Triangle.sides
Triangle.new.sides
```

Executing `Triangle.sides` returns `nil`. Executing `Triangle.new.sides` returns the integer `3`. This demonstrates  that class variables are available to all subclasses via inheritance and are scoped at the class level. Class variables are defined at the class level and is available to all the instances of the class. Just one copy of the class variable exists for the Class and all of its instances. Reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program irreversibly. This means that if a subclass changes the class variable then the value referenced would have changed to the new value when we try to access the class variable through a superclass. 

Answer re-do
`line 25` returns `nil` and `line 26` returns the integer `3`.

On `line 25` when we invoke the `sides` class method on the object `Triangle`, Ruby looks in the method lookup path for any class method with the name `sides`. It finds it in the `Shape` class. At this point the value referenced by the class variable `@@sides` within the `Shape` class is `nil`. Ruby resolves `@@sides` to be `nil` and so `line 25` returns `nil`. On `line 26` the `sides` instance method is called on the object of the `Triangle` class. Within the object the `@@sides` instance variable is referencing the integer `3`. When Ruby looks for another method within the method lookup path it finds sides in the `Shape` class and returns integer `3`.

## Example 19 - attr_* for every instance variable
What is the attr_accessor method, and why wouldn’t we want to just add attr_accessor methods for every instance variable in our class? Give an example.

Because setter and getter methods are so commonplace, Ruby gives us a built-in short hand to create them: `attr_accessor`. This method takes a symbol as an argument, which is used to create the method name for both the getter and the setter methods. This is nice because we can now replace long and cumbersome method definitions with a single line.

If you have attributes that you do not want modified from outside the class, you can create a getter method without a setter method for them by using the shorthand `attr_reader`. Further, if you want to be able to modify an attribute without necessarily being able to view it outside the class (such as for sensitive information like a a social security number or password), you can create a setter without a getter by using the `attr_writer` shorthand.
```
class Person
  attr_reader :name
  attr_writer :secret
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    puts "Hi, my name is #{name}!"  # we can access @name through a getter
  end
  
  def have_a_birthday
    self.age += 1                   # we can change @age through a setter
  end
end

john = Person.new('John', 30)

# We can access @name through a getter, but cannot change it through a setter
john.introduce                      # => Hi, my name is John!
john.name                           # => 'John'
john.name = 'Johnny'                # => NoMethodError

# We can assign @secret through a setter, but cannot access it through a getter
john.secret = 'afraid of clowns'    # Appends 'afraid of clowns' to @secret
john                                # => #<Person:0x0000561b2b42ac88 @age=30, @name="John", @secret="afraid of clowns">
john.secret                         # => NoMethodError

# We can both access and reassign @age because it has both a getter and a setter
john.age                            # => 30
john.have_a_birthday
john.age                            # => 31
```

Answer re-do
The accessor methods are used to access and set the state of the object to read, set and update the values referenced by the instance variables.

The accessor methods takes symbols as arguments which it uses to create getter and setter methods.

`attr_reader` are getter methods which are read-only which is used to access and expose the value referenced by the instance variables.

`attr_writer` methods are used to define setter methods without having to define a setter method. These are write only methods used to set or update the state of the object.

Adding the `attr_accessor` method to every instance variable in the class will make the data referenced by the instance variable to be accessed from outside of the class. Hence we will be able to acess the value referenced by the instance variables and also and modify them permanently
```
class Student
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

student = Student.new("Bob", 30)
p student.name # "Bob"
p student.age  # 30

student.name = "Mike"
student.age = 50

p student.name # "Mike"
p student.age  # 50
```
In the above example we able to access and change the state of the object from outside of the class.

## Example 20
What is the difference between states and behaviors?
Behaviors are defined by methods. States are defined by instance variables

Answer re-do
Objects encapsulate the state. Classes define the attributes of the behavior of the objects. The instance variables track the state of the object. The state of the Object is unique to the object. The behaviors or the methods are what the objects can do. The instance methods can access the instance variable

Classes are basic oulines of what an object is made of. Classes define the attributes and the behaviors of its objects. Common behaviors are grouped within a class.
```
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

bob = Person.name("Bob")
bob.name
```
In the above example the object refenced by bob encapsulates the state `@name = "Bob"`

The state of the object is exposed by the instance method/behavior name when it is called on the object in `line 12`