class IdeaPolicy < ApplicationPolicy
  def new?
    record.campaign.member?(user)
  end

  def create?
    new?
  end

  def update?
    record.user == user || record.campaign.game_master?(user)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def show?
    update?
  end

  def index?
  end

  def toggle_interesting?
    record.campaign.game_master?(user)
  end
end
