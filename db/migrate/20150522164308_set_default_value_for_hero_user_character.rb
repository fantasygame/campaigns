class SetDefaultValueForHeroUserCharacter < ActiveRecord::Migration
  def change
    change_column :heros, :user_character, :boolean, default: false
  end
end
