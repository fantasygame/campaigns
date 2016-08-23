class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :comments, as: :subject

  delegate :member?, to: :campaign

  alias_method :author, :user

  validates :title, :campaign, :user, presence: true

  def self.search(search)
    if search
      search = "%#{search}%"
      Idea.all.where("title LIKE ? OR description LIKE ?", search, search)
    else
      Idea.all
    end
  end
end
