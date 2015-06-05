class AddMoneyToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :money, :integer, default: 0
  end
end
