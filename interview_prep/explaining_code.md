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


## Use attr_* to create setter and getter methods
## How to call setters and getters
## Instance methods vs. class methods
## Method Access Control
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