class RenameMoneyLogToMoneyBefore < ActiveRecord::Migration
  def change
    rename_column :money_histories, :money_log, :money_before
  end
end
