class AddSystemToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :system, :string
  end
end
