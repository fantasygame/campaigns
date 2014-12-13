class Post < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :game
  belongs_to :user

  alias_method :author, :user

  validates :content, presence: true
end
