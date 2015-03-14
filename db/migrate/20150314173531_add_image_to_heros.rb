class AddImageToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :image, :json
  end
end
