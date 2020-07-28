class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items 
    has_many :items, through: :cart_items
    enum state: {
        in_progress: "in_progress",
        completed: "completed", 
        abandoned: "abandoned"
    }

    # attr_accessor :state

    

    def add_item(item_id, quantity)
        item = Item.find(item_id)
        item_quantity = quantity.to_i 

        cart_items = CartItem.find_or_create_by(
            cart_id: self.id, 
            item_id: item.id, 
            quantity: item_quantity,
            item_price: item.price_in_cents * item_quantity
        )
    end

    def remove_item(item_id)
        cart_item = CartItem.find_by(item_id: item_id, cart_id: self.id)

        if (cart_item.quantity > 1)
            cart_item.quantity -= 1
            cart_item.save
        elsif (cart_item.quantity == 1)
            cart_item.destroy 
        end
    end

    def submit_cart(id)
        cart = Cart.find_by(id)
        cart.state = "completed"
        cart.save
    end
end
