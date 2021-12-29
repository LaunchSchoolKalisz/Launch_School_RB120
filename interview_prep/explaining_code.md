# Study Guide

## Classes 
 Basic oulines of what an object is made of. Classes define the attributes and the behaviors of its objects. Classes group common behaviors.

## Objects
 Objects are instances of a class and they encapsulate the state of the object. Objects are instantiated by calling the `::new` class method on the class.

 ```
 class Person
  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hi, my name is #{@name}!"
  end
end

marts = Person.new("Martha")
```
The `#initialize` method initializes a new Person object, which it does by assigning the instance variable @name to the person's name specified by the argument.
The `#say_hello` instance method prints a message that includes the person's name in place of `#{@name}`. `say_hello` returns `nil`.
`marts` is the object created by calling the `::new` class method on the `Person` class
`marts` has a state `@name = 'Martha'`

### Object Instantiation
A object/instance is instantiated by calling the `::new` class method on the class. This triggers the constructor method initialize. The Object may or may not take arguments. If aguments are taken, the arguments are passed in while creating a new object. Objects are assigned to the parameter available in the constructor class.
```
class Person
  def initialize(name)
    @name = name
  end
end
```
### Instance Variables
These are variables which start with the @ (example: @instance_variable). Scoped at the object level. They are available throughout the instance of the object. The objects encapsulate the state of the object. The state of an object is the colllection of all of its instance variables and the values it references. Instance methods are used to access the value referenced by the instance variables. 

Instance variables exist as long as the object exists. Once the Object is destroyed then the instance variable perishes along with it.

### Uninitialized Instance Variables
Uninitialized instance variables always return `nil` when we try to access them through the getter method. 
When we try to access an uninitialised local variable it will raise an error.

### Instance Methods
Instance methods are the behaviors or functionality available to the objects or the instance of the class. They are defined within the classes from which the objects are derived from. Instance variables can be accessed and exposed by the instance methods. Instance variables exists as long as the instance of the class exists and it perishes if the object perishes.

Good practice: Reassign the instance variables using the setter method. This is because the getter/setter methods are much easier to reference if we ever need to retrieve or modify the state of the object as we can make changes in just one place.
```
def instance_methods(data) # defining an instance method
  data * 2
end
```
### Class Methods
Methods which are called on the class itself. Scoped at the class level, are not available to any instances of the class. They cannot access instance variables. They are used when we need behaviours/methods that are not related to any objects.

```
class Person
  def self.class_method
    "I am from within the class method"
  end
end

Person.class_method # invoking the class method
```

### Class variables
Class variables are accessible from within the instance methods and class methods. Class variable are defined at the class level and is available to all the instances of the class. Just one copy of the class variable exists for the Class and all of its instances. Hence reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program irreversibly. This means that if a subclass changes the class variable then the value referenced would have changed to the new value when we try to access the class variable through a superclass. Due to this reason utilizing class variables can cause unexpected behavior and due to this Rubyists tend to stay away from it.

#### Instance methods vs class methods
Instance methods are called on the instances of the class. Instance methods are the behaviours or functionality available to the objects. They are encapsulated in the Classes from which the objects are derived from. Instance variables can be accessed by the instance methods. Example:

```
class Person
  def	instance_method
    "From the instance method"
  end
end

p Person.new.instance_method
# => "From the instance method"
```
Class methods are methods which are called on the class itself. They scoped at the class level and are not available to any instances of the class. They cannot access instance variables. While defining the class methods we chain the method name to the self keyword as shown in the example below.
```
class Person
  def self.class_method
    "I am from within the class method"
  end
end

Person.class_method # invoking the class method
```
## Setter and Getter methods
### Getter methods
Getter methods are read-only methods which are used to access the value referenced by the instance variable.

```
class Person
  def initialize(name)
    @name = name
  end

  # getter method
  def	name
    @name
  end
end

marts = Person.new("Martha")
p marts.name
```

### Setter Method
Setter methods are write-only methods which are used to set or update the value referenced by the instance variable.

```
class Person
  def initialize(name)
    @name = name
  end

  # getter method
  def	name
    @name
  end

  # setter method
  def name=(input)
    @name = input
  end
end

marts = Person.new("Martha")
p marts.name # => "Martha"

marts.name = "Another name"
p marts.name # => "Another name"
```
Note: good practice  to reassign the instance variables using the setter method. This is because the getter/setter methods are much easier to reference if we ever need to retrieve or modify the state of the object as we can make changes in just one place. If you try to access an uninitialized instance variable it always returns nil.

### Getter method for privacy
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

### Using attr_*
The accessor methods are used to access and set the state of the object to read, set and update the values referenced by the instance variables.

The accessor methods takes symbols as arguments which it uses to create getter and setter methods.

attr_reader are getter methods which are read-only which is used to access and expose the value referenced by the instance variables.

attr_writer methods are used to define setter methods without having to define a setter method. These are write only methods used to set or update the state of the object.

attr_accessor methods are used as a short-hand to write both the getter and the setter methods. They are used to access and set the state of the object to read, set and update the values referenced by the instance variables.

## Fake Operators
Many operators in Ruby are actually methods inherited from another class. Due to this we can override these methods and have our own implementation within the inheriting sub classes. As a general rule of thumb the methods in this case the fake operators should behave in a way simillar to the original methods in order to avoid unexpected/undesired results.

## Method access Control
In Ruby the method access control is implemented by the use of public, private and the protected access modifiers.

### Public Methods
By default all the instance methods within the class are public methods apart from the constructor method initialize which is a private method. Public methods can be accessed from within the class and also from outside of the class. If one knows the class name or the object name then we can access these methods.

### Private Methods
Private methods are methods that are accessible within the class but is not available outside of the class to the rest of the program. They are available to one instance of the class at any given time.

```
class Person
  def money_available
    "You have £#{account_balance} in your account"
  end

  private

  def account_balance
    5000
  end
end

Person.new.money_available
```
### Protected Methods
Protected methods are available within the class and all of its subclasses. They act as public methods when called within the class and as private methods outside of the class hiearchy. They can be used to compare two objects.
```
class Student
  def initialize(grade)
    @grade = grade
  end

  def >(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

bob = Student.new(80)
john = Student.new(90)

p bob > john # => false
p john > bob # => true
```

## Inheritance - Class and Modules
### Class Inheritance
Inheritance reduces dependencies and increases code resusability. We can use inheritance to extract common behaviours to a superclass. This helps us to keep the logic in one place. All the methods inherited from a superclass is available to its subclass. This is a great way to model concepts that are naturally hiearchical.

class vs interface(mix-in) inheritance:
- If multiple inheritance is needed, use Interface inheritance as subclasses inherit from only one superclass.
- Modules cannot inherit. Modules cannot create objects. So, in order to create objects we use class inheritance
- Modules have a "has-a" relationship: used for namespacing and grouping commom behaviours to be shared.
- Classes have a "is-a" relationship: it is useful for creating objects.

A subclass inherits the behaviours from a superclass. The subclass is the derived class and the super class is the base class. The superclass has a larger reusability and the subclass has an extended or refined implementation. This reduces complexity of the code and makes it reusable. Class Inheritance displays Is - A relationship.
```
class Mammal # superclass
end

class Dog < Mammal # subclass
end
```

### Interface Inheritance - modules
In Ruby multiple inheritance is acheived by mixin modules. The inheritance achieved through mixing in modules are known as Interface Inheritance. We mix in a behaviour from a module using the include method and passing in the name of the module as an argument to it. Modules are used as containers for grouping common methods and namespacing. Grouping simillar or related classes within a module is known as namespacing. Interface inheritance have a "has - a" relationship. Eg. The Dog has a behaviour(.i.e, a method). Modules are useful for grouping common methods from classes that are not related hierarchially.
```
module Swimmable
  def swim
    "I can swim!!!"
  end
end

class Human
  include Swimmable
end

class Dog
  include Swimmable
end

puts Human.new.swim
puts Dog.new.swim
```
## Method Lookup Path
The order in which Ruby inspects different classes and modules when a method is invoked is known as the method lookup path. Ruby looks for the method in the inheritance hierarchy up untill it finds the first instance of the method and then invokes it. If no method is found then it will raise a `NoMethodError`. This can be determined by calling the `::ancestors` class method on the class under question.
```
module Speakable
  def speak(sound)
    "I am a #{self.class} and I can say #{sound}!!"
  end
end

class Animal
  include Speakable
end

class Human < Animal
end

puts Human.new.speak("Hello")
# => "I am a Human and I can say Hello!!"
p Human.ancestors
# => [Human, Animal, Speakable, Object, Kernel, BasicObject] ---> "method lookup path"
```
### Super
A keyword used by Ruby to invoke a method with the same name within the method lookup path. When we invoke a method which has a super keyword, Ruby looks in the method lookup path to find another method with the same name. Ruby invokes the method when it finds it.

The super keywords can also take arguments. But by default it will pass all the arguments passed into the calling method to the other method with the same name. In order to avoid this we can call the super keyword with a parenthesis such as super().

### Self
The `self` keyword is an explicit caller. The `self` keyword represents the class or the object of a class depending upon the scope where it is used.

In `line xxx - xxx` we are using the `self` keyword while defining a method. In `line xxx` the `self` in the expression `self.xxxx` represents the class `ClassName`. Hence this is a class method. Within the class method the `self` keyword also represents the class `xxxx`.

In `line xxx - xxx` the `self` keyword is used within the setter instance method `xxxx`. Within an instance method, the `self` keyword is the calling object and hence in `line xxx` it represents the `object xxx`, which is an instance of the `xxx class`.

### Constants
How can we access constants from outside of the class?
In order to access the constants from outside of the class where it is defined we will have to use the namespace resolution operator. This is in the format `Class::CONSTANT`. The namespace resolution operator is used between the class name and the constant.

#### Lexical scope
When Ruby looks for a constant it first looks for the constant in the class which references it and then looks up the inheritance hierarchy when it cannot find it. This is because the constants in Ruby have a lexical scope.

### Polymorphism
Polymorphism occurs when objects of different types respond to the method invocation with the same name. It helps in reducing dependencies.

Polymorphism are broadly classed into two types

- Polymorphism through inheritance
- Polymorphism through Duck Typing

When the subclass inherits behavior from one of its superclass because it could not find the method in the subclass then polymorphism occurs. This type of polymorphism is known as Polymorphism through Inheritance as we are inhering the behaviours. Since method overriding is also a type of inheritance this is also Polymorphism through Inheritance .

When object of unrelated classes respond to the invocation of the instance method with the same name then this is known as Polymorphism through Duck Typing.

### Encapsulation
Ruby creates objects and exposes the interfaces to interact with those objects. Due to this it is possible that the data could be unintentionally modified. Also this can also increase the dependencies between different objects. Ruby enables us to hide the behaviour and its implementation by making it not visible to the rest of the code in order to reduce dependencies and to prevent the data from being exposed to unwanted parts of the code. This is known as Encapsulation and this is acheived through the use of Method Access Control or access modifiers which determines if the methods are public, private or protected. In Ruby all the instance methods are public by default unless we implement method access control. The exception being the constructor method initialize which is always private. All instance variables are encapsulated by default and we use the instance method to expose them.


## Reading OO code
## Fake operators and equality
## Truthiness
## Working with collaborator objects