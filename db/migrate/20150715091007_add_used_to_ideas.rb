class AddUsedToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :used, :boolean, default: false
  end
end
