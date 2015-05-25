class AddDefaultValueToSold < ActiveRecord::Migration
  def change
    change_column :items, :sold, :boolean, default: false
  end
end
