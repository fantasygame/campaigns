class PointsCalculator
  attr_accessor :user, :campaign

  def initialize(user, campaign = nil)
    self.user = user
    self.campaign = campaign
  end

  def call
    posts_points + vote_points
  end

  private

  def posts_points
    if campaign.blank?
      user.posts.count
    end
  end

  def vote_points
    if campaign.blank?
      user.votes.count
    end
  end
end