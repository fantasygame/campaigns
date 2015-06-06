class RemoveLastOwnerIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :last_owner_id, :integer
  end
end
