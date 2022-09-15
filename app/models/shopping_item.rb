class ShoppingItem < ActiveRecord::Base
    belongs_to :shopping_category
    belongs_to :user
end