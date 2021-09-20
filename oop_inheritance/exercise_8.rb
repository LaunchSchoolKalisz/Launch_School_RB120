=begin
Given the following code...

bob = Person.new
bob.hi

And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

The problem is that we are attempting to call a private method within the Person class
We can move the method so that it is no longer private 

#LS Solution
The problem is that the method hi is a private method, therefore it is unavailable to the 
object. I would fix this problem by moving the hi method above the private method call in the class.
=end

