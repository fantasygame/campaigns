class AddLastOwnerToItems < ActiveRecord::Migration
  def change
    add_column :items, :last_owner, :integer
  end
end
