class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  validates :title, :campaign, :user, presence: true

  def self.search(search)
    if search
      search = "%#{search}%"
      Idea.all.where('title LIKE ? OR description LIKE ?', search, search)
    else
      Idea.all
    end
  end
end
