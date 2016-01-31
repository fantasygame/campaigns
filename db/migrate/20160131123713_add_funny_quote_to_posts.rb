class AddFunnyQuoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :funny_quote, :boolean, default: :true
  end
end
