
class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.references :item, foreign_key: true
      t.integer :price, null: false
      t.integer :profit, null: false
      t.timestamps
    end
  end
end
