class CreateLargeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :large_categories do |t|
      t.integer :category_id
      t.string :name
      t.timestamps null: true
    end
  end
end
