class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :phone_number
      t.integer :giftee_id
      t.boolean :chosen
      t.integer :family_id
      t.string  :password

      t.timestamps
    end
  end
end