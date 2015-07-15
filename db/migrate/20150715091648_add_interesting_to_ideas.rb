class AddInterestingToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :interesting, :boolean, default: false
  end
end
