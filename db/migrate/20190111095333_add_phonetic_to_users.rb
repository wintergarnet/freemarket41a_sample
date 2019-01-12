class AddPhoneticToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phonetic, :string
  end
end
