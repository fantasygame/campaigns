class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :hero, index: true
      t.belongs_to :game, index: true
    end
    add_foreign_key :players, :heros
    add_foreign_key :players, :games
  end
end
