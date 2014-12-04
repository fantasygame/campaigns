class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name, null: :false, default: ''
      t.text :description, null: :false, default: ''
      t.belongs_to :game_master, index: true

      t.timestamps
    end
  end
end
