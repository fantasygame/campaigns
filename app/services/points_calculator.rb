class PointsCalculator
  attr_accessor :user, :campaign

  def initialize(user, campaign = nil)
    self.user = user
    self.campaign = campaign
  end

  def call
    posts_points + vote_points + interesting_idea_points + used_idea_points
  end

  private

  def posts_points
    if campaign.blank?
      user.posts.count
    else
      campaign.posts.where(user: user).count
    end
  end

  def vote_points
    if campaign.blank?
      user.votes.count
    else
      (user.votes.select { |vote| vote.campaign == campaign }).count
    end
  end

  def interesting_idea_points
    idea_points(:interesting)
  end

  def used_idea_points
    idea_points(:used)
  end

  def idea_points(type)
    if campaign.blank?
      user.ideas.where(type => true).count
    else
      campaign.ideas.where(user: user, type => true).count
    end
  end
end
