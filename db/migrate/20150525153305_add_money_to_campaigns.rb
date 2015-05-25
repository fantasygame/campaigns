class AddMoneyToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :money, :integer, default: 0
  end
end
