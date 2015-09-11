class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :subject, polymorphic: true

  alias_method :author, :user
end
