class AddSoldPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :sold_price, :integer, default: 0
  end
end
