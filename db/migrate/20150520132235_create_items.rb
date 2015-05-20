class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.boolean :sold
      t.references :campaign, index: true
      t.references :hero, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :campaigns
    add_foreign_key :items, :heros
  end
end
