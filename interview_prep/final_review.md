
Objects are instances of a class and they *encapsulate the state of the object*. States are assigned to instance variables. 
The state of the object consists of all instance variables and their values. Objects encapsulate the state and classes define the attributes of the behavior of the objects. The instance variables track the state of the object. The state of the Object is unique to the object. The behaviors or the methods are what the objects can do. The instance methods can access the instance variable
Not an object: method, block, variable

Class methods: scoped at the class levels, not available to instances of the class

Common uses for modules: Storing and grouping common methods, namespacing, capturing unrelated methods

## Namespacing
Consists of organizing similar classes under a module, or using a module to group related classes. Doing so makes it easier to recognize related classes and reduces the likelihood of classes colliding with other similarly names classes in our codebase.

### Polymorphism
Polymorphism occurs when objects of different types respond to the method invocation with the same name. It helps in reducing dependencies.

### eql?
determines if two objects contain the same value and if they are of the same class. It's used most frequently by hashes to determine equality among it's members (because keys must be unique). It's not used very often.

### equal?
Used to determine whether two variables not only have the same value, but whether they reference the same object. We do not want to override this method!

### === 
An instance method that is used implicitly with case statements. When === compares two objects it's really asking, if the calling object is a group, does the object passed as an argument belong in that group?

### ==
Often custom defined. Fake operator. Original == is defined in BasicObject. == checks to see if the two objects being compared are equal to each other

### Class Variable 
Class variables are accessible from within the instance methods and class methods. Available to all subclasses via inheritance. Scoped at the class level. Class variables are defined at the class level and is available to all the instances of the class. Just one copy of the class variable exists for the Class and all of its instances. Reassigning the class variable at any point in the class hierarchy will change the value referenced by the class variable for the rest of the program irreversibly.

### Instance Variable Definition
Used to tie data to an individual object. The state of an object is the colllection of all of its instance variables and the values it references. Instance methods are used to access the value referenced by the instance variables.
Instance variables exist as long as the object exists. Once the Object is destroyed then the instance variable perishes along with it.

### Constant scope
Lexical scope: first looks for the constant in the class which references it, then up the inheritance hirearchy if it can't find it.
