class Post < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :game
  belongs_to :user
  has_many :votes
  has_many :comments

  delegate :member?, to: :game

  alias_method :author, :user

  validates :content, presence: true
end
