class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :campaign, index: true

      t.timestamps null: false
    end
    add_foreign_key :ideas, :users
    add_foreign_key :ideas, :campaigns
  end
end
