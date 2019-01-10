class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :image
      t.text :description
      t.string :status
      t.string :ship_from
      t.string :delivery_fee
      t.string :pre_date
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end
  end
end
