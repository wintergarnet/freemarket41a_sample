class AddPhoneticLastToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phonetic_last, :text
  end
end
