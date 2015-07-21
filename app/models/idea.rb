class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  validates :title, presence: true
  validates :campaign, presence: true
  validates :user, presence: true

  def self.search(search)
    if search
      search = "%#{search}%"
      Idea.all.where('title LIKE ? OR description LIKE ?', search, search).all
    else
      Idea.all
    end
  end
end
