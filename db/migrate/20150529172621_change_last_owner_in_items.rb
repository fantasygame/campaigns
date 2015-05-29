class ChangeLastOwnerInItems < ActiveRecord::Migration
  def change
    rename_column :items, :last_owner, :last_owner_id
  end
end
