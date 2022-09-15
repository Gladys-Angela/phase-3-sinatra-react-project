class CreateShoppingItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_items do |t|
      t.string :title
      t.integer :shopping_category_id
      t.float :price
      t.integer :amount
      t.timestamps
    end
  end
end
