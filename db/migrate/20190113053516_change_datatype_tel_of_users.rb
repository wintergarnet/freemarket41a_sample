class ChangeDatatypeTelOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :tel, :string, limit: 11
  end
end

