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

## Referencing and setting instance variables vs. using getters and setters
## Class inheritance, encapsulation, and polymorphism
## Modules
## Method lookup path
## self
  ### Calling methods with self
  ### More about self
## Reading OO code
## Fake operators and equality
## Truthiness
## Working with collaborator objects