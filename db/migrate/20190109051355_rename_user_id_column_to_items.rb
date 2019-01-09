class RenameUserIdColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :use_id, :user_id
  end
end
