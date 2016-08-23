class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  alias_method :author, :user
end
