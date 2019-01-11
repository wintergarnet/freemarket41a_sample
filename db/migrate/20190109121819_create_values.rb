class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.references :item, forreign_key: true unless index_exists?(:values, :item_id)
      t.integer :price, null: false
      t.integer :profit, null: false
      t.timestamps
    end
  end
end
