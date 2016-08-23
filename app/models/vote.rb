class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  alias_method :author, :user
  delegate :campaign, to: :post
end
