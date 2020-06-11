class CreateSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :socials do |t|
      t.string :provider
      t.string :uid
      t.references :user, null: false, foreign_key: true
    end
  end
end
