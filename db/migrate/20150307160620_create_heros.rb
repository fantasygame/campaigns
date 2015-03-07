class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :archetype
      t.string :race
      t.string :alignment
      t.string :deity
      t.text :titles
      t.text :appearance
      t.text :background
      t.text :mechanics
      t.belongs_to :user, index: true
      t.belongs_to :campaign, index: true

      t.timestamps null: false
    end
    add_foreign_key :heros, :users
    add_foreign_key :heros, :campaigns
  end
end
