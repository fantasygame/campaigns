class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :reward, index: true
      t.belongs_to :campaign, index: true
      t.belongs_to :user, index: true
      t.string :name
      t.integer :cost
      t.boolean :used

      t.timestamps
    end
  end
end
