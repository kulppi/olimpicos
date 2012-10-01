class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.text :phone
      t.text :description
      t.string :password_hash
      t.string :password_salt
      t.integer :country_id
      t.boolean :active
      t.integer :city_id
      t.integer :gender
      t.string :image
      t.boolean :active

      t.timestamps
    end
  end
end
