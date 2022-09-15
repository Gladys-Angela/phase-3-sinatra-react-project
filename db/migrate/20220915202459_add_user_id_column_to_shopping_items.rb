class AddUserIdColumnToShoppingItems < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_items, :user_id, :integer
  end
end
