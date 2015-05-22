class AddUserCharacterToHeros < ActiveRecord::Migration
  def change
     add_column :heros, :user_character, :boolean
  end
end
