class AddVisibleToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :visible, :boolean, default: false
  end
end
