=begin
If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Which one of these is a class method (if any) and how do you know? How would you call a class 
method?
manufacturer is a class method because self is called with the method

LS Solution
Class methods in Ruby start with self so in this case the self.manufacturer method is the class 
method.

You can call a class method by using the class name and then calling the method. For example here 
it would be Television.manufacturer.
=end