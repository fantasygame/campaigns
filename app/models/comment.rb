class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  alias_method :author, :user
end
