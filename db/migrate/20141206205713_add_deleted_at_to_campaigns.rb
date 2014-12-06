class AddDeletedAtToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :deleted_at, :datetime
    add_index :campaigns, :deleted_at
  end
end
