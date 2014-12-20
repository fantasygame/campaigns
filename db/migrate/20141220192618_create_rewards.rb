class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost
      t.belongs_to :campaign, index: true

      t.timestamps
    end
  end
end
