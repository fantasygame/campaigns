class AddDefaultPriceValueToItems < ActiveRecord::Migration
  def change
    change_column :items, :price, :integer, default: 0
  end
end
