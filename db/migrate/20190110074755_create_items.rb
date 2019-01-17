class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :status, null:false
      t.string :name, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.string :item_condition, null: false
      t.string :ship_from, null: false
      t.string :delivery_fee, null: false
      t.string :pre_date,null: false

      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end
  end
end
