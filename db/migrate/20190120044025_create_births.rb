class CreateBirths < ActiveRecord::Migration[5.0]
  def change
    create_table :births do |t|
      t.references :user, forreign_key: true
      t.date :year
      t.date :month
      t.date :day
      t.timestamps
    end
  end
end
