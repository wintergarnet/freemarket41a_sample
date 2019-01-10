class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, forreign_key: true
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.integer :post_code

      t.timestamps
    end
  end
end
