class RemoveDefaultValueFromSoldPrice < ActiveRecord::Migration
  def change
    change_column :items, :sold_price,  :integer
  end
end
