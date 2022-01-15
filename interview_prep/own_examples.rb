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
  
  class Team
    def	instance_method
      "From the instance method"
    end
  end
  
  p Team.new.instance_method
  
=begin
  Class methods are methods which are called on the class itself. They scoped at the class level and are not available to any 
  instances of the class. They cannot access instance variables. Define a behavior of the class as a whole. While defining the class 
  methods we chain the method name to the self keyword as shown in the example below.
=end
  
  class Team
    def self.class_method
      "I am from within the class method"
    end
  end
  
Team.class_method

# Setter and Getter Methods
  # Getter Methods

  class Team
    def initialize(team_name)
      @team_name = team_name
    end

    def team_name
      @team_name
    end
  end

  badgers = Team.new("Badgers")
  puts badgers.team_name

  # Setter Methods

  class Team
    def initialize(team_name)
      @team_name = team_name
    end

    def team_name=(new_name)
      @team_name = new_name
    end
  end

  badgers = Team.new("Badgers")
  p badgers
  badgers.team_name = "GO Badgers"
  p badgers

  # Using attr_*
    # Getter method
    class Team
      attr_reader :team_name 

      def initialize(team_name)
        @team_name = team_name
      end
    end

    badgers = Team.new("Badgers")
    p badgers.team_name

    # Setter method
    class Team
      attr_writer :team_name

      def initialize(team_name)
        @team_name = team_name
      end
    end

    badgers = Team.new("Badgers")
    p badgers
    badgers.team_name = ("GO Badgers")
    p badgers

    # Getter and Setter
    class Team
      attr_accessor :team_name
      
      def initialize(team_name)
        @team_name = team_name
      end
    end

    badgers = Team.new("Badgers")
    puts badgers.team_name
    badgers.team_name = "GO Badgers"
    puts badgers.team_name


# Method Access Control
  # Public
  # Private

  class Team
    attr_accessor :team_name
    attr_reader :state
  
    def initialize(team_name, state)
      @team_name = team_name
      @state = state
    end
  
    def to_s
      "The #{state} #{team_name}!!!"
    end
  
    private
    attr_writer :state
  end
  
  badgers = Team.new("Badgers", "Wisconsin")
  puts badgers
  badgers.state = "Illinois"
  
  # Protected
  class Team
    def initialize(team_name, state)
      @team_name = team_name
      @state = state
    end
  
    def to_s
      "The #{state} #{team_name}!!!"
    end
  
    def ==(other_team)
      state == other_team.state
    end
  
    private
    attr_writer :state
    attr_accessor :team_name
  
    protected
    attr_reader :state
  end
  
  badgers = Team.new("Badgers", "Wisconsin")
  puts badgers
  bucks = Team.new("Bucks", "Wisconsin")
  puts bucks
  puts badgers == bucks
  badgers.state

# Inheritance
  # Class Inheritance

  class Team 
    attr_accessor :team_name, :state

    def initialize(team_name, state)
      @team_name = team_name
      @state = state
    end
  end

  class Basketball < Team
  end

  badgers = Basketball.new("Badgers", "Wisconsin")
  p badgers

  # Interface Inheritance
  
  module Travelable
    def can_travel
      true
    end
  end

  class Team
    attr_accessor :state

    def initialize(team_name, state)
      @team_name = team_name
      @state = state
    end
  end

  class Hockey < Team
    include Travelable
  end

  class Basketball < Team
  end

  hockey_team = Hockey.new("Blackhawks", "Illinois")
  p hockey_team
  p hockey_team.can_travel

  basketball_team = Basketball.new("Bulls", "Illinois")
  p basketball_team
  p basketball_team.can_travel

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

