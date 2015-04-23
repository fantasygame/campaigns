class AddImageToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :image, :string
  end
end
