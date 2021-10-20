=begin
Which of the following are objects in Ruby? If they are objects, how can you find out what class 
they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

They are all objects. You can find the class by:
=end

p true.class
p "hello".class
p [1, 2, 3, "happy days"].class
p 142.class

=begin
LS Solution

All of them are objects! Everything in Ruby is an object, so you never need to ask yourself "is 
this an object?" because the answer every time will be yes.

You can find out what class an object belongs to in Ruby by asking the object what its class is 
by calling the method class on the object, as you can see below:

irb :001 > true.class
=> TrueClass
irb :002 > "hello".class
=> String
irb :003 > [1, 2, 3, "happy days"].class
=> Array
irb :004 > 142.class
=> Integer

=end
