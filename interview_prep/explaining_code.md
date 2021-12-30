# Study Guide

## Classes 
 Basic oulines of what an object is made of. Classes define the attributes and the behaviors of its objects. Classes group common behaviors.

## Objects
 Anything that has a value can be considered an object. Basically, things like numbers, strings, arrays, classes, and modules. Methods, blocks, and variables are not objects. Objects are instances of a class and they encapsulate the state of the object. Objects are instantiated by calling the `::new` class method on the class.
 Objects are created from classes (which are also another type of Object).
 
 Class = a blueprint Object = something built from that blueprint

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
A object/instance is instantiated by calling the `::new` class method on the class. This triggers the constructor method initialize which defines the behavior we want to execute when a new object is initialized. The Object may or may not take arguments. If aguments are taken, the arguments are passed in while creating a new object. Objects are assigned to the parameter available in the constructor class.
```
class Person
  def initialize(name)
    @name = name
  end
end
```
### Instance Variables
These are variables which start with the @ (example: @instance_variable). Scoped at the object level. They are available throughout the instance of the object. The objects encapsulate the state of the object. Used to tie data to an individual object. The state of an object is the colllection of all of its instance variables and the values it references. Instance methods are used to access the value referenced by the instance variables. 

Instance variables exist as long as the object exists. Once the Object is destroyed then the instance variable perishes along with it.

Because instance variables track individual object state, they are scoped at the object level. That is, they cannot cross over between different objects, but they are available throughout the instance methods for any particular object.

This basically means that for any given object, you can access an instance variable within an instance method without passing it in, even if it was initialized outside of that particular instance method.

### Uninitialized Instance Variables
Uninitialized instance variables always return `nil` when we try to access them through the getter method. 
When we try to access an uninitialised local variable it will raise an error.

### Instance Methods
Instance methods are the behaviors or functionality available to all instances of that class. They are defined within the classes from which the objects are derived from. Instance variables can be accessed and exposed by the instance methods. Instance variables exists as long as the instance of the class exists and it perishes if the object perishes.

Good practice: Reassign the instance variables using the setter method. This is because the getter/setter methods are much easier to reference if we ever need to retrieve or modify the state of the object as we can make changes in just one place.
```
def instance_methods(data) # defining an instance method
  data * 2
end
```

### Class Methods
Methods which are called on the class itself. Scoped at the class level, are not available to any instances of the class. We do not have to instantiate any objects to invoke a class method, since they pertain to the class as a whole.They cannot access instance variables. They are used when we need behaviours/methods that are not related to any objects. 

```
class Person
  def self.class_method
    "I am from within the class method"
  end
end

Person.class_method # invoking the class method
```
To define a class method, prepend the method name with the keyword `self`. In this case, `self` will refer to the class (upon which the method must be invoked).

### Class variables
Defined by @@

Class variables are accessible from within the instance methods and class methods. Scoped at the class level. Class variables are defined at the class level and is available to all the instances of the class. Just one copy of the class variable exists for the Class and all of its instances. Reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program irreversibly. This means that if a subclass changes the class variable then the value referenced would have changed to the new value when we try to access the class variable through a superclass. Due to this reason utilizing class variables can cause unexpected behavior and due to this Rubyists tend to stay away from it.

#### Instance methods vs class methods
Instance methods are called on the instances of the class (individual object, must be instantiated). Instance methods are the behaviors or functionality available to the objects. Define a single behavior. They are encapsulated in the Classes from which the objects are derived from. Instance variables can be accessed by the instance methods. Example:

```
class Person
  def	instance_method
    "From the instance method"
  end
end

p Person.new.instance_method
# => "From the instance method"
```
Class methods are methods which are called on the class itself. They scoped at the class level and are not available to any instances of the class. They cannot access instance variables. Define a behavior of the class as a whole. While defining the class methods we chain the method name to the self keyword as shown in the example below.
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
The order in which Ruby inspects different classes and modules when a method is invoked is known as the method lookup path. Ruby looks for the method in the inheritance hierarchy up untill it finds the first instance of the method and then invokes it. If no method is found then it will raise a `NoMethodError` or  `NameError`. This can be determined by calling the `::ancestors` class method on the class under question.
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
Ruby will first check the closest class to the class or object that invokes the method. Next, it will check any modules that are included into that class. If more than one module is included, it will check the last included module first. This means that we can override methods from earlier included modules, just as we can override methods from a superclass.

Next, it will check the superclass, and any modules included in the superclass, which are also inherited by the subclass. It will keep moving up along the chain in this outward order until it reaches BasicObject, the last superclass for all objects in Ruby

### Super
A keyword used by Ruby to invoke a method with the same name within the method lookup path. When we invoke a method which has a super keyword, Ruby looks in the method lookup path to find another method with the same name. Ruby invokes the method when it finds it.

The super keywords can also take arguments. But by default it will pass all the arguments passed into the calling method to the other method with the same name. In order to avoid this we can call the super keyword with a parenthesis such as super().

```
# passing along only some arguments
class Pet
  def initialize(name)
    @name = name
  end
end

# this will not work
class Cat < Pet
  def initialize(name, personality)
    super     # passes two arguments Pet#initialize expects only one
    @personality = personality
  end
end

felix = Cat.new('Felix', 'playful')
# => ArgumentError (wrong number of arguments (given 2, expected 1))

# this will work
class Cat < Pet
  def initialize(name, personality)
    super(name) # passes only the `name` argument to Pet#initialize
    @personality = personality
  end
end

felix = Cat.new('Felix', 'playful')
# => #<Cat:0x000055e2ac7e4908 @name="Felix", @personality="playful">
```

Since the `xxx` constant is referenced within this method without a qualifying namespace, Ruby checks the up the method lookup path to see if it defines the constant. Since it doesn't find it, Ruby raises a NameError error.

### Self
The `self` keyword is an explicit caller. The `self` keyword represents the class or the object of a class depending upon the scope where it is used.

In `line xxx - xxx` we are using the `self` keyword while defining a method. In `line xxx` the `self` in the expression `self.xxxx` represents the class `ClassName`. Hence this is a class method. Within the class method the `self` keyword also represents the class `xxxx`.

In `line xxx - xxx` the `self` keyword is used within the setter instance method `xxxx`. Within an instance method, the `self` keyword is the calling object and hence in `line xxx` it represents the `object xxx`, which is an instance of the `xxx class`.

### Constants
How can we access constants from outside of the class?
In order to access the constants from outside of the class where it is defined we will have to use the namespace resolution operator. This is in the format `Class::CONSTANT`. The namespace resolution operator is used between the class name and the constant.

#### Lexical scope
When Ruby looks for a constant it first looks for the constant in the class which references it and then looks up the inheritance hierarchy when it cannot find it. This is because constants in Ruby have a lexical scope.

### Polymorphism
Polymorphism occurs when objects of different types respond to the method invocation with the same name. It helps in reducing dependencies.

Polymorphism are broadly classed into two types

- Polymorphism through inheritance
- Polymorphism through Duck Typing

When the subclass inherits behavior from one of its superclass because it could not find the method in the subclass then polymorphism occurs. This type of polymorphism is known as Polymorphism through Inheritance as we are inhering the behaviours. Since method overriding is also a type of inheritance this is also Polymorphism through Inheritance .

When object of unrelated classes respond to the invocation of the instance method with the same name then this is known as Polymorphism through Duck Typing.

### Encapsulation
Ruby creates objects and exposes the interfaces to interact with those objects. Due to this it is possible that the data could be unintentionally modified. Also this can also increase the dependencies between different objects. Ruby enables us to hide the behaviour and its implementation by making it not visible to the rest of the code in order to reduce dependencies and to prevent the data from being exposed to unwanted parts of the code. This is known as Encapsulation and this is acheived through the use of Method Access Control or access modifiers which determines if the methods are public, private or protected. In Ruby all the instance methods are public by default unless we implement method access control. The exception being the constructor method initialize which is always private. All instance variables are encapsulated by default and we use the instance method to expose them.

## Collaborator Objects

An object that is stored as a state (i.e. within an instance variable) within another object. The are called collaborators because they work in conjunction with the class they are associated with.

Collaborator objects are usually custom objects (i.e. defined by programmer and not built into Ruby). Technically, a string or other built in object type that's saves as a value in an instance variable would still be a collaborator object but we don't really tend to think of them that way.

Collaborator objects represent the connections between various actors in the program. When thinking about how to structure your various classes, objects, and all the ways in which they might connect, think about:

- What collaborators will a custom class need?
- Do the associations between a custom class and its collaborators make sense?
- What makes sense here technically?
- What makes sense here with respect to modeling the problem we are attempting to solve?
- At the end of the day, collaborator objects allow us to chop up and modularize the problem domain into cohesive pieces.

A Library is a class representing a collection of Book objects.
```
class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def <<(book)
    books.push(book)
  end

  def checkout_book(title, author)
    book = Book.new(title, author)
    if books.include?(book)
      books.delete(book_to_checkout)
    else
      puts "The library does not have that book"
    end
  end
end

class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_s
    "#{title} by #{author}"
  end

  def ==(other)
    title == other.title && author == other.author
  end
end

lib = Library.new

lib << Book.new('Great Expectations', 'Charles Dickens')
lib << Book.new('Romeo and Juliet', 'William Shakespeare')
lib << Book.new('Ulysses', 'James Joyce')

lib.books.each { |book| puts book }
  # => Great Expectations by Charles Dickens
  # => Romeo and Juliet by William Shakespeare
  # => Ulysses by James Joyce

lib.checkout_book('Romeo and Juliet', 'William Shakespeare')
  # deletes the Romeo and Juliet book object from @books and returns it

lib.books.each { |book| puts book }
  # => Great Expectations by Charles Dickens
  # => Ulysses by James Joyce

lib.checkout_book('The Odyssey', 'Homer')
  # => The library does not have that book
```
First we initialize our Library object. When this object is instantiated, the @books instance variable is initialized as well and assigned to an empty array. We are going to use the array as a way to facilitate our collection implementation, so that the Library class can internally rely on the Array interface to manipulate the collection of Book objects. Technically, the array here would be a collaborator object, however, the relationship between Array and Library is not really meaningful in terms of the program design.

Next, we add three instances of Book to the Library object. We've defined an << method in Library to facilitate the addition of each Book object to the @books array such that we can utilize Ruby's syntactical sugar and not really worry about the internal mechanics of how each Book is getting added to the Library instance. This is an example of encapsulation.

We can call the Array#each method on the value returned by the getter method books in order to output each Book object as a string. Doing so shows us that each Book instance has indeed been added to our Library collection object.

The Book instances here are what we are concerned with when we say collaborator objects. We consider these to be collaborators because they are separate object with a separate interface that has been added to an attribute of Library. Further, the Book interface interacts meaningfully with the Library implementation, allowing us to access that interface without necessarily needed to know about it through our manipulations of the Library instance outside the class.

Next, we call the checkout_book method and pass it the arguments 'Romeo and Juliet' and 'William Shakespeare'. Within the checkout_book implementation we perhaps have our most interesting interaction between Library and Book. We know we are searching through an array of Book objects, so first we instantiate a new Book with the arguments given. Then, the method checks to see if the Library has the book (using Array#include?). If it does, it removes that book object (which we can do having defined a custom Book#== method) and returns it. If the book is not found, the method will output a message to the user saying that the library does not have that particular book.

In this case, the Book with the title 'Romeo and Juliet' is found, removed, and returned. We can verify this by again outputting all the books in the Library by calling each on the value returned by books. At this point, this will only output two books, Great Expectations and Ulysses.

Finally, we test out our guard clause by trying to check out a book the library does not have. checkout_book executes as expected and the string 'The library does not have that book' is output.

We say that the relationship between Book and Library here is one of collaboration because a library has books. Which books the library contains and what they are called is an aspect of it's state. Therefore, the relationship of inheritance would not be appropriate here.

Example 2
A Deck is a class representing a collection of Card objects
```
class Deck
  attr_accessor :cards
  
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    
    cards.shuffle!
  end
  
  def deal_one_card
    cards.pop
  end
end

class Card
  SUITS = %w(Hearts Clubs Diamonds Spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  
  attr_accessor :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  
  def to_s
    "The #{value} of #{suit}"
  end
end

deck = Deck.new

hand = []

5.times { hand << deck.deal_one_card }
  
hand.each { |card| puts card }
  # => The 10 of Diamonds
  # => The Queen of Clubs
  # => The 10 of Spades
  # => The Jack of Clubs
  # => The 8 of Diamonds
  # (cards are randomly selected, output may differ)
```
In the above code, we define our Deck class to work with the collaborator object Card. When a new Deck instance is initialized, the Deck class relies on the Card class constants SUITS and VALUES to generate a new 52 card deck.

The Deck instance in this case is really a vehicle for manipulating and organizing Card objects. While it may utilize the Card attributes of suit and value, it isn't really concerned with them in the way that a Card object might be.

Because the Card objects are assigned to one of the Deck attributes (the instance variable @cards) we say that the Card instances here are collaborator objects that work intrinsically with Deck.

## Fake Operators and Equality
Lots of operators in Ruby are really method calls using the disguise of Ruby's syntactical sugar to utilize a more visually appealing syntax. Because they are really methods, we can define our own implementations of them within our custom classes. Doing so overrides the fake operators with our own implementation, so it's important to follow the conventions established for each within the Ruby standard library.

### Equivalence
Equivalence is the idea of equality. Because == in Ruby is in fact a method and not an operator, we can define custom ideas of equality for our custom objects.

Many of the built in Ruby object classes already have custom definitions that determines what we are checking for when we check for equality.
```
a = 'hello world'
b = 'hello world'

# checks to see if they are the same object in memory
a.equal?(b)     # => false

# checks to see if they reference identical values
a == b          # => true
```
### ==
The == method has a special syntax to make it look like a normal operator that is part of Ruby's syntactical sugar. It is not, however, an operator, but an instance method. We can, therefore, assume that the value used for comparison of each calling instance is determined by its class.

The original == is defined in BasicObject, from which all other class in Ruby descend. Therefore, all classes have a == method available to them. But many classes define their own == method which overrides the superclass method and specifies the unique value each class should use for comparison.

By default, the == method will check to see if the two objects being compared are the same object in memory (just like the equal? method shown below). In order to check unique values for equality in our custom defined classes, we need to override the == implementation from BasicObject.
```
# Using the default `==` method
class Student
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end
end

joe_1 = Student.new('Joe', 12345)
joe_2 = Student.new('Joe', 12345)

joe_1 == joe_2                          # => false
```
In the above code, we define the class Student such that it's instances exhibit the attributes name and id. Then we initialize two Student objects and assign identical values to both attributes. However, when we invoke the == method on the instance referenced by joe_1, the implementation of == is still that of BasicObject. == is comparing the two objects to see if they are the same object in memory. joe_1 and joe_2 reference two separate objects so == returns false.
```
# custom defined == method
class Student
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end

  def ==(other_student)
    id == other_student.id
  end
end

joe_1 = Student.new('Joe', 12345)
joe_2 = Student.new('Joe', 12345)

joe_1 == joe_2                          # => true
```
In the above code, In the above code, we define the class Student such that it's instances exhibit the attributes name and id. Then we initialize two Student objects and assign identical values to both attributes. However, Student also has a custom == method defined which overrides the inherited behavior from BasicObject. In this case, we are using Integer#== to compare the id values from two instances of Student. joe_1 and joe_2 have identical id values, so the Student#== method will return true.

We can define our custom == methods in whatever way makes the most sense for the object in question. In this case, we choose to compare id numbers as two students of the same name may not be the same student. However, a unique id number is assigned to each student enrolled so that is what we choose to asses for finding equivalence.

Note that almost every core class in Ruby has their own implementation for ==. We can rely on these implementations as well when defining out own ==.

When you define a custom == method, it automatically assumes the same implementation for !=. That means that given the Student class example above, the following will also work:
```
bob_1 = Student.new('Bob', 67890)
joe_1 != bob_1                        # => true
```
### equal? and object_id
The equal? method is a method used to determine whether two variables not only have the same value, but whether they reference the same object.

a = 'hello world'
b = 'hello world'
a == b                # => true
a.equal? b            # => false

a = [1, 2, 3, 4]
b = [1, 2, 3, 4]
a == b                # => true
a.equal? b            # => false
Be careful not to override this method by creating your own custom equal?. It's much better to implement a custom == method as described above instead.

You can also compare two object's object ids to get the same result as using equal?.

Every object has a method called object_id that returns a unique identifying number for that object. This method is a good way to determine if two variables are pointing to the same object, or if they merely hold identical values. Two different variables that are pointing to the same object will both return the same number. That number is completely unique so if the variable in question references a different object, object_id will return a different number entirely.
```
# strings
str1 = 'something'
str2 = 'something'

p str1.object_id                      # => 60 <or some randomly generated num>
p str2.object_id                      # => 80 <or some randomly generated num>

p str1.object_id == str2.object_id    # => false

# arrays
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]

p arr1.object_id == arr2.object_id    # => false

# symbols
sym1 = :something
sym2 = :something

p sym1.object_id == sym2.object_id    # => true

# integers
int1 = 5
int2 = 5
p int1.object_id == int2.object_id    # => true
```
In the above code, we initialize two string objects and compare their distinct object ids'. The object id for str1 is different from that of str2 so they are two separate objects in memory. Similarly for the two initialized array objects arr1 and arr2.

Then we compare two symbol object sym1 and sym2, which are apparently the same object in memory, despite us initializing the two symbols :something. Similarly, int1 and int2 both reference the same object in memory, the integer 5. This is because both symbols and integers are immutable objects. Though it may look like we are initializing more than one symbol or integer, in reality this is not the case. In Ruby, immutable objects that have the same value actually represent the same object in memory. Therefore, there is only ever one symbol :something or integer 5. Any assignment statements that involve it will cause the variable to reference the same object in memory.

### ===
The === method is an instance method that is used implicitly with case statements. When === compares two objects it's really asking, if the calling obect is a grjoup, does the object passed as an argument belong in that group?.
```
a = 'hello'
b = 'hello'
a === b         # => true
# essentially asking does ['hello'] include 'hello'?

a = 1
b = 1
a === b         # => true
# essentially asking does [1] include 1?

a = 'words'
String === a    # => true
# does the String class include 'words'?

b = 5
(1..9) === b     # => true
# does the Range (1..9) include 5?

String === b    # => false
# does the String class include 5?
```
Behind the scenes, a case statement is using === to compare the value in the when clause with the value declared by case.
```
num = 42

case num
when (1..25)    then puts 'first quarter'
when (26..50)   then puts 'second quarter'
when (51..75)   then puts 'third quarter'
when (76..100)  then puts 'last quarter'
else            puts 'not in range'
end

# => second quarter
```

Note that defining a custom behavior for === is not often necessary, because using a custom class in a case statement is pretty unusual.

### eql?
The eql? method determines if two objects contain the same value and if they are of the same class. It's used most frequently by hashes to determine equality among it's members (because keys must be unique). It's not used very often.

### Fake Operators
Ruby's syntactical sugar allows us to use more natural expressions with many methods, and this make them look like operators. It's important to know which of these so called "operators" is a method that's acting as a fake operator because these can be custom defined for our custom classes to change their default behavior.

| Method | Operator | Description |
| :---        |    :----   |   :--- |
| no |	., :: |	Method/constant resolution operators |
| yes |	[], []= |	Collection element getter and setter method |
| yes |	** |	Exponential operator |
| yes |	!, ~, +, - |	Not, complement, unary plus and minus (method names for the last two are +@ and -@) |
| yes |	*, /, | %	Multiply, divide, and modulo |
| yes |	+, - |	Plus, minus |
| yes |	>>, << |	Right and left shift |
| yes |	& |	Bitwise "and" |
| yes |	^, | `	` |
| yes |	<=, <, >, >= |	Less than/equal to, less than, greater than, greater than/equal to |
| yes |	<=>, ==, ===, !=, =~, !~ |	Equality and pattern matching (!= and !~ cannot be directly defined) |
| no |	&& |	Logical "and" |
| no |	` |	 |
| no |	.., ... |	Inclusive range, exclusive range |
| no |	? : |	Ternary if-then-else |
| no |	=, %=, +=, !=, &=, >>=, <<=, *=, **=, {} |	Assignment (and assignment shortcuts) and block delimiter |

Note that overriding fake operators can be dangerous. Since there are so many, we never really know what an expression like obj1 + obj2 will do.

### Equality Methods
One of the most common fake operators to override is ==. This also provides us with an != method. See equivalence.

### Comparison Methods
Implementing our own custom behavior for comparison methods gives us a nice syntax we can use to compare our custom objects. By default, the comparison methods do not know how or what values to compare. We define them to tell them which values we want to compare, again relying on the specific implementations for comparison methods within Ruby's built in classes.

Note that unlike == and !=, defining > does not automatically give us <. If we want to use both we have to define them both within our class.
```
# this will not work
class Athlete
  attr_accessor :name, :height

  def initialize(name, height)
    @name = name
    @height = height  # height value is in meters
  end
end

shaq = Athlete.new('Shaq', 2.16)
kobe = Athlete.new('Kobe', 1.98)

puts 'shaq is taller than kobe' if shaq > kobe
# => NoMethodError: undefined method '>'
```

In the above code, we define a class Athlete whose instances exhibit the attributes name and height. We then initialize two new Athlete objects shaq and kobe. shaq is assigned an @height of 2.16 meters during initialization and kobe is assigned an @height of 1.98 meters during initialization. We then try to compare the two Athlete objects with > to see which one is taller.

However, we have no defined a > method for our Athlete class. > is in fact an instance method we need to define for the class so Ruby knows which values within the object to compare, and not an operator as it might appear.

```
# this will work
class Athlete
  attr_accessor :name, :height

  def initialize(name, height)
    @name = name
    @height = height  # height value is in meters
  end
  
  def >(other_athlete)
    height > other_athlete.height # relies on float#>
  end
end

shaq = Athlete.new('Shaq', 2.16)
kobe = Athlete.new('Kobe', 1.98)

puts 'shaq is taller than kobe' if shaq > kobe
# => 'shaq is taller than kobe'
```
In the above code, we define a custom > that tells Ruby what values to compare within our Athlete objects. In this case, it's the value referenced by the instance variable @height. We rely on the Float#> method to implement our custom Athlete#> method. Then when we call Athlete#> on the shaq object and pass it the kobe object as an argument, Ruby executes the Athlete#> implementation, which compares the @height of each object. In this case, shaq has a greater height than kobe so 'shaq is taller than kobe' is output.

Note that the above does not automatically generate an Athlete#< method. If we wish to utilize this, we'll need to define it individually, which we can do quickly like so:

```
def <(other_athlete)
  !self.>(other_athlete)
end
```

### Right and Left Shift
When implementing fake operators choose functionality that makes sense when used with the operator-like syntax that you are defining.

For example, custom defining an << or >> method can provide a good interface when working with an object that represents a collection. For a class that describes a collection like this, we can even utilize some kind of guard clause withing our << implementation to reject adding items unless some criteria is met.
```
class GradeLevel
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(student)
    # guard clause, assume we have a Student#passed_previous_grade? defined
    # return unless student.passed_previous_grade?
    members.push student
  end
end

# define Student class for collaborator objects
class Student
  attr_accessor :name, :gpa

  def initialize(name, gpa)
    @name = name
    @gpa = gpa
  end
end

juniors = GradeLevel.new('Juniors')
sophia = Student.new('Sophia', 3.75)
jim = Student.new('Jim', 3.04)
arnold = Student.new('Arnold', 2.99)

juniors << sophia
juniors << arnold
juniors << jim

p juniors.members
# => [#<Student:0x000056194369c190 @name="Sophia", @gpa=3.75>, #<Student:0x000056194369c0f0 @name="Arnold", @gpa=2.99>, #<Student:0x000056194369c140 @name="Jim", @gpa=3.04>]
```
In the above code, we define two classes. A GradeLevel class, which is a collection of Student collaborator objects, represented by the instance variable @members which points to an empty array upon initialization. We define a custom left shift method <<, which allows us to add Student collaborator objects to the @members array using Ruby's syntactical sugar. We rely on the Array#push method for implementation so that we can mirror the pattern set forward by Ruby's buit in object's behavior with <<.

This is shown to operate the way we want when we instantiate a new GradeLevel object, juniors and add the three Student objects sophia, jim, and arnold to it. We can see by inspecting the members attribute for our juniors grade level that it now consists of an array of three Student objects.

### The Plus Method
+ and other arithmetic operators are actually methods and not operators at all. This means that we can also custom define arithmetic operations for our custom classes. As with << we'll want to try and keep our implementation within the pattern of behavior that is set up by the built in Ruby classes for +.

In this case, we notice that + should be either incrementing or concatenating the calling object with an argument. Let us also notice that + returns a value of the same class of the calling object and the argument passed to it. This means that we don't necessarily want to to return the value we get from whatever #+ method we utilize in our implementation, we want to initialize a new object of the class we are defining to represent our incremented or concatenated value.

```
class GradeLevel
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(student)
    members.push student
  end

  def +(other_grade)
    result_group = GradeLevel.new('New Group')
    # Use Array#+ to change the @members of the new grade to return
    result_group.members = members + other_grade.members
    result_group
  end
end

class Student
  attr_accessor :name, :gpa

  def initialize(name, gpa)
    @name = name
    @gpa = gpa
  end
end

juniors = GradeLevel.new('Juniors')
juniors << Student.new('Sophia', 3.75)
juniors << Student.new('Jim', 3.04)
juniors << Student.new('Arnold', 2.99)

seniors = GradeLevel.new('Seniors')
seniors << Student.new('Barbara', 3.88)
seniors << Student.new('Margaret', 3.65)
seniors << Student.new('Charles', 3.25)

upperclassmen = juniors + seniors
p upperclassmen
# => #<GradeLevel:0x000055b7df29ec48 @name="New Group", @members=[#<Student:0x000055b7df29eea0 @name="Sophia", @gpa=3.75>, #<Student:0x000055b7df29ee50 @name="Jim", @gpa=3.04>, #<Student:0x000055b7df29ee00 @name="Arnold", @gpa=2.99>, #<Student:0x000055b7df29ed38 @name="Barbara", @gpa=3.88>, #<Student:0x000055b7df29ece8 @name="Margaret", @gpa=3.65>, #<Student:0x000055b7df29ec98 @name="Charles", @gpa=3.25>]>
```

The code above relies on the same classes GradeLevel and Student from above. We further define a custom GradeLevel#+ method so that we can combine two GradeLevel instances according to the pattern set up by + in the Ruby docs. Our implementation of GradeLevel#+ initializes a new GradeLevel object to return, this will hold all the members of both the calling GradeLevel object, juniors and the argument passed, the GradeLevel object seniors.

We then utilize the members getter method to access the arrays of students that represent the members of each GradeLevel object, and use Array#+ to concatenate both. Returning the newly generated GradeLevel object allows us to complete implementation, and now when we call + on a GradeLevel instance, we will get a new GradeLevel value returned. This can be shown when we output the result of upperclassmen.inspect (with p), which prints a string representation of the new GradeLevel objects, whose instance variable @members now points to an array containing all the Student objects from the juniors GradeLevel object and the seniors GradeLevel object.

### Element Setters and Getters
If we are working with a class that represents a collection, we can also custom define element getter and setter methods. This allows us to take advantage of Ruby's syntactical sugar with regards to element reference and reassignment.

|Actual Method Call	| Syntactical Sugar |
| --- | --- | 
| array.[](2)	|array[2] |
| array.[]=(4, 'fifth element')	| array[4] = 'fifth element' |

In our GradeLevel example class, we have defined instance variable @members as an array of collaborating Student objects. Therefore, we can define custom element setter and getter methods for @members that allow us to modify the collection via Ruby's syntactical sugar. Our implementation will rely on Array#[] and Array#[]=.

```
class GradeLevel
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(student)
    members.push student
  end

  def +(other_grade)
    result_group = GradeLevel.new('New Group')
    result_group.members = members + other_grade.members
    result_group
  end

  def [](index)
    # return the element from @members at the specified index
    members[index]
  end

  def []=(index, object)
    # reassign the element from @members at the specified index to the object passed as argument
    members[index] = object
  end
end

class Student
  attr_accessor :name, :gpa

  def initialize(name, gpa)
    @name = name
    @gpa = gpa
  end
end

juniors = GradeLevel.new('Juniors')
juniors << Student.new('Sophia', 3.75)
juniors << Student.new('Jim', 3.04)
juniors << Student.new('Arnold', 2.99)

juniors[2]      # => #<Student:0x00005584601cbe40 @name="Arnold", @gpa=2.99>

juniors[2] = Student.new('Bianca', 3.89)
juniors[2]      # => #<Student:0x00005584601cbc88 @name="Bianca", @gpa=3.89>
```
## Reading OO code
## Truthiness
