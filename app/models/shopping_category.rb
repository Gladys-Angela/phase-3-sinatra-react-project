class ShoppingCategory < ActiveRecord::Base
    has_many :shopping_items
    has_many :users, through: :shopping_items
end

