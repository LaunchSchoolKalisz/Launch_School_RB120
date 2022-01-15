# For each: How? What? Why? Along with own code example
  # To focus on especially: Polymorphism, capsulation, collaborator objects

# Classes and Objects
  # Objects
  # Classes
  # Object Instantiation
  class Team
    def initialize(team_name)
      @team_name = team_name
    end
  end
  
  badgers = Team.new("Badgers")
  p badgers
  
  # Instance Variables
  # Instance Methods
  class Team
    attr_reader :team_name

    def initialize(team_name)
      @team_name = team_name
    end
  
    def introduce
      puts "GoOoOoOo #{team_name}"
    end
  end
    
  badgers = Team.new("Badgers")
  badgers.introduce

  # Class Variables
  # Class Methods
  
  class Team
    @@number_of_teams = 0
  
    def initialize(team_name)
      @@number_of_teams += 1
      @team_name = team_name
    end
  
    def self.print_number_of_teams
      puts @@number_of_teams
    end
  end
  
  badgers = Team.new("Badgers")
  Team.print_number_of_teams
  tarheels = Team.new("Tarheels")
  Team.print_number_of_teams
  
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
  class Person
    def initialize(name)
      @name = name
    end
  
    def name
      @name
    end
  end
  
  marts = Person.new("Martha")
  p marts.name

  # Setter Methods
  class Person
    def initialize(name)
      @name = name
    end
  
    def name=(name)
      @name = name
    end
  end
    
  marts = Person.new("Martha")
  p marts 
  marts.name = "Mart"
  p marts


  # Using attr_*
    # Getter method
    class Person
      attr_reader :name 

      def initialize(name)
        @name = name
      end
    end

    marts = Person.new("Martha")
    p marts.name

    # Setter method
    class Person
      attr_writer :name 

      def initialize(name)
        @name = name
      end
    end

    marts = Person.new("Martha")
    p marts 
    marts.name = "Mart"
    p marts

    # Getter and Setter

    class Person
      attr_accessor :name

      def initialize(name)
        @name = name
      end
    end

    marts = Person.new("Martha")
    p marts.name
    marts.name = "Mart"
    p marts.name

# Method Access Control
  # Public
  # Private
  class Person
    attr_accessor :name
  
    def initialize(name, account_number)
      @name = name
      @account_number = account_number
    end
  
    def my_account
      puts "We are keeping our account number safe: #{account_number}"
    end
  
    private
    attr_reader :account_number
  end
  
  marts = Person.new("Martha", 12345)
  marts.my_account
  marts.account_number
  
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
    class Person
      attr_reader :name
      
      def initialize(name)
        @name = name
      end
      
      def nickname
        "Mr. #{name}"
      end
    end
    
    class Adult < Person
      def 
    end
    
    
    # Polymorphism Through Duck Typing

class Dolphin
  def sleep
   puts "Half my brain sleeps at a time!" 
  end
  
end

class Human
  def sleep
   puts "zzzzzzzzzzzzzzzz!" 
  end
end

class Robot
  def sleep
   puts "Turned off" 
  end
end

arr = [Dolphin.new, Human.new, Robot.new]
arr.each {|obj| obj.sleep }
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

