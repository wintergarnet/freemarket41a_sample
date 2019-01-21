class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true, null: false
      t.string :item_id, null: false
      t.timestamps
    end
  end
end
