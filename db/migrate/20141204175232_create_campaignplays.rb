class CreateCampaignplays < ActiveRecord::Migration
  def change
    create_table :campaignplays do |t|
      t.belongs_to :campaign, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
