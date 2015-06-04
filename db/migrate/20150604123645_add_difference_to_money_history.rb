class AddDifferenceToMoneyHistory < ActiveRecord::Migration
  def change
    add_column :money_histories, :difference, :integer
  end
end
