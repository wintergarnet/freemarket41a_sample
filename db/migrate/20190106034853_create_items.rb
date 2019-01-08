class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      # todo: 外部キー制約t.references :use_id, foreign_key: true
      t.integer :use_id, null: true
      t.string :name, null: true
      t.string :image, null: true
      t.text :description, null: true
      t.string :status, null: true
      t.integer :delivery_fee, null: true
      t.string :pre_date, null: true
      t.timestamps
    end
  end
end
