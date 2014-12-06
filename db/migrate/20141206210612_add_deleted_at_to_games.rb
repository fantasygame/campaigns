class AddDeletedAtToGames < ActiveRecord::Migration
  def change
    add_column :games, :deleted_at, :datetime
    add_index :games, :deleted_at
  end
end
