=begin
If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

What happens in each of the following cases:

case 1:

hello = Hello.new
hello.hi

case 2:

hello = Hello.new
hello.bye

case 3:

hello = Hello.new
hello.greet

case 4:

hello = Hello.new
hello.greet("Goodbye")

case 5:

Hello.hi
=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.greet

=begin
Case 1
hello = Hello.new
hello.hi

This code will print "Hello" to the console

Case 2
hello = Hello.new
hello.bye

This code will print an error stating that there is no 'bye' method for that object

Case 3
hello = Hello.new
hello.greet

This code will also print an error because we need to pass an onbject to the greet method

Case 4
hello = Hello.new
hello.greet("Goodbye")

case 5:
Hello.hi
=end