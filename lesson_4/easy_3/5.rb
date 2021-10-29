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

What would happen if I called the methods like shown below?

tv = Television.new 
tv.manufacturer #Error 
tv.model  #Run

Television.manufacturer # Run 
Television.model # Error

This is because manufacturer is a class method and model is an instance method
=end