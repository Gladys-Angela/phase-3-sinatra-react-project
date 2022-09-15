class CreateShoppingItemCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_categories do |t|
      t.string :name
    end
  end
end
