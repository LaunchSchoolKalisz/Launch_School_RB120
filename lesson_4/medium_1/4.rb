=begin
Let's practice creating an object hierarchy.

Create a class called Greeting with a single instance method called greet that takes a string argument 
and prints that argument to the terminal.

Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. 
The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class 
should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing 
the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.
=end

class Greeting 
  def greet(message = "Here's a message for you!")
    puts "#{message}"
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

hello = Hello.new
hello.hi
hello.greet
hello.greet("Hi")

