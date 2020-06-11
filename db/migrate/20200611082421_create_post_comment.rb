class CreatePostComment < ActiveRecord::Migration[6.0]
  def change
    create_table :post_comments do |t|
      t.text :content, null: false
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.index [:user_id, :post_id], unique: true
      t.timestamps
    end
  end
end
