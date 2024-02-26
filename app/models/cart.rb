=begin
The convention is that each item selected will be added to a virtual shopping cart, held in our store.
At some point, our buyers will have everything they need and will proceed to our site’s checkout, where they’ll pay for the stuff in their carts.

This means that our application will need to keep track of all the items added to the cart by the buyer. 
To do that, we’ll keep a cart in the database and store its unique identifier, cart.id, in the session.
Every time a request comes in, we can recover that identifier from the session and use it to find the cart in the database.

That has_many :line_items part of the directive is fairly self-explanatory: a cart (potentially) has many associated line items.
These are linked to the cart because each line item contains a reference to its cart’s ID.
The dependent: :destroy part indicates that the existence of line items is dependent on the existence of the cart.
If we destroy a cart, deleting it from the database, we want Rails also to destroy any line items that are associated with that cart.
=end

class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    # checks if our list of items already includes the product we’re adding
    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity +=1
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

    def total_price
        line_items.sum { |item| item.total_price }
    end
end
