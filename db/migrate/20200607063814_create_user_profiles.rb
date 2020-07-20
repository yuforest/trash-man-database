class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, default: "", null: false
      t.string :image
      t.text :biography
      t.references :user, null: false, foreign_key: true
    end
  end
end
