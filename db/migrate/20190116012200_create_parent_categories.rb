class CreateParentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_categories do |t|
      t.references :item, foreign_key: true
      t.integer :large_category, null: false
      t.integer :midium_category, null: false
      t.integer :small_category
      t.timestamps
    end
  end
end
