class TodoList < ActiveRecord::Migration[6.1]
  def change
    add_column :todolist, :favorite, :boolean
  end
end
