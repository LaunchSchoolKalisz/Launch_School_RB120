=begin
Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", 
she says.

Can you spot the mistake and how to address it?
Quantity only has a getter method, not a setter method. Can update :quantity to be an attr_accessor
=end

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
LS Solution
The problem is that since quantity is an instance variable, it must be accessed with the @quantity 
notation when setting it. Even though attr_reader is defined for quantity, the fact that it's a reader 
means that there is implicitly a method for retrieving the value (a "getter") but the setter is 
undefined. So there are two possible solutions:

1. change attr_reader to attr_accessor, and then use the "setter" method like this: 
  self.quantity = updated_count if updated_count >= 0

2. reference the instance variable directly within the update_quantity method, like this 
  @quantity = updated_count if updated_count >= 0
=end