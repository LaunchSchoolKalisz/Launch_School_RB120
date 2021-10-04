=begin
Using the following code, create a class named Person with an instance variable named @secret. Use a setter
method to add a value to @secret, then use a getter method to print @secret.

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

Expected output:

Shh.. this is a secret!
=end

class Person
  attr_accessor :secret

  #def initialize
    #@secret = secret
  #end

  #def to_s 
    #'Shh.. this is a secret!'
  #end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

=begin
LS Solution

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
Discussion
All of the instance methods used in the exercises so far have been public methods. Public methods can be 
accessed from both within the class and outside the class.

In the solution, we use attr_accessor to automatically create the getter and setter methods. They can also be 
written manually, like this:

class Person
  def secret
    @secret
  end

  def secret=(value)
    @secret = value
  end
end

=end