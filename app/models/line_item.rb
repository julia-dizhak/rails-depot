=begin
This table represents line items in a shopping cart. 
connection products to carts

we’ve duplicated the product’s price in the line item data.
Here we’re breaking the “initially, keep it simple” rule slightly,
but it’s a transgression based on experience.
If the price of a product changes, that price change shouldn’t be reflected in the line item price of currently open orders,
so each line item needs to reflect the price of the product at the time the order was made.
=end
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end
