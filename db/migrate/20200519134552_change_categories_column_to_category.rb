class ChangeCategoriesColumnToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :tools, :categories, :category
  end
end
