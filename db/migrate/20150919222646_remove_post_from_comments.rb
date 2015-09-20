class RemovePostFromComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :post, index: true, foreign_key: true
  end
end
