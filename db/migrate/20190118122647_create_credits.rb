class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :user, index: { unique: true }, foreign_key: true
      t.string :card_token
      t.timestamps
    end
  end
end
