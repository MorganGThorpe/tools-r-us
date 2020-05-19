class AddCategoriesToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :categories, :string
  end
end
