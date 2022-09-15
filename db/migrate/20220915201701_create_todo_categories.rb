class CreateTodoCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_categories do |t|
      t.string :name
    end
  end
end

