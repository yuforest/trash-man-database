class AddCategoryToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category, :integer, null: false, default: 0
  end
end
