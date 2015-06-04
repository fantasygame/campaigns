class CreateMoneyHistories < ActiveRecord::Migration
  def change
    create_table :money_histories do |t|
      t.integer :money_log
      t.references :campaign, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :money_histories, :campaigns
    add_foreign_key :money_histories, :users
  end
end
