class Item < ApplicationRecord
    has_many :cart_items
    has_many :carts, through: :cart_items

    monetize :price_in_cents, as: "price"

    
end
