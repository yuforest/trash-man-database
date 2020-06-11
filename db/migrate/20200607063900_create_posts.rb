class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :approval, default: 0, null: false
      t.timestamps
    end
  end
end
