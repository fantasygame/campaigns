class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :post, index: true, null: false

      t.timestamps
    end
  end
end
