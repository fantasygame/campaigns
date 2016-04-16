class CreateEventOptionSelects < ActiveRecord::Migration
  def change
    create_table :event_option_selects do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :day
      t.integer :hour

      t.timestamps null: false
    end
  end
end
