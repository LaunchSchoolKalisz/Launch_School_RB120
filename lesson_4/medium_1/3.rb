=begin
In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart 
application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance 
variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to 
change attr_reader to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?

Not necessarily wrong, but it depends on if you want to call the instance variable itself. You wouldn't
want to use self.quantity, though because that is calling the the class and if you have a setter method
you don't need self.
=end