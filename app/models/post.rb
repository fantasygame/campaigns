class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :game
  belongs_to :user
  has_many :votes
  has_many :comments, as: :subject

  delegate :member?, :campaign, to: :game

  alias_method :author, :user

  validates :content, presence: true
end
