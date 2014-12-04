class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, nil: :false, default: ''
      t.belongs_to :campaign, index: true

      t.timestamps
    end
  end
end
