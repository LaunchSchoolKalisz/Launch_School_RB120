# For each: How? What? Why? Along with own code example
  # To focus on especially: Polymorphism, capsulation, collaborator objects

# Classes and Objects
  # Objects
  # Classes
  # Object Instantiation

class Person
  def initialize(name)
    @name = name
  end
end

marts = Person.new("Martha")
p marts

  # Instance Variables
  # Instance Methods

class Person
  def initialize(name)
    @name = name
  end

  def introduce
    puts "Hi, my name is #{@name}"
  end
end
  
marts = Person.new("Martha")
marts.introduce

  # Class Variables
  # Class Methods

class Person
  @@total_people = 0

  def initialize(name)
    @name = name
    @@total_people += 1
  end

  def introduce
    puts "Hi, my name is #{@name}"
  end

  def self.number_of_people
    puts "We have instantiated #{@@total_people} People Objects."
  end
end
    
marts = Person.new("Martha")
marts.introduce
Person.number_of_people
benj = Person.new("Jon Benjamin")
Person.number_of_people

  # Instance Methods vs Class Methods
=begin 
Instance methods are called on the instances of the class (individual object, must be instantiated). Instance methods are the 
behaviors or functionality available to the objects. Define a single behavior. They are encapsulated in the Classes from which the 
objects are derived from. Instance variables can be accessed by the instance methods
=end

class Person
  def	instance_method
    "From the instance method"
  end
end

p Person.new.instance_method

=begin
Class methods are methods which are called on the class itself. They scoped at the class level and are not available to any 
instances of the class. They cannot access instance variables. Define a behavior of the class as a whole. While defining the class 
methods we chain the method name to the self keyword as shown in the example below.
=end

class Person
  def self.class_method
    "I am from within the class method"
  end
end

Person.class_method

# Setter and Getter Methods
  # Getter Methods
  # Setter Methods
  # Using attr_*
# Method Access Control
  # Public
  # Private
  # Protected
# Inheritance
  # Class Inheritance
  # Interface Inheritance
  # Method Lookup Path
  # Super
  # Object Methods
  # Variable Scope with Inheritance
# Polymorphism & Encapsulation
  # Polymorphism
    # Polymorphism Through Inheritance
    # Polymorphism Through Duck Typing
  # Encapsulation
# Modules
  # Mixin Modules
  # Namespacing
  # Module Methods
# Self
  # Inside Instance Methods
  # Inside Class Methods
  # Inside Class Definitions
  # Inside Mixin Modules
  # Outside Any Class
# Fake Operators and Equality
  # Equivalence
    # ==
    # equal? and object_id
    # ===
    # eql?
  # Fake Operators
    # Comparison Methods
    # Right and Left Shift
    # Plus
    # Element Setters and Getters
# Collaborator Objects