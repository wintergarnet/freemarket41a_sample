class AddTelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tel, :string, limit:11
  end
end
