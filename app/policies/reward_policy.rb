class RewardPolicy < ApplicationPolicy
  def new?
    record.campaign.game_master?(user)
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def edit?
    new?
  end

  def destroy?
    new?
  end

  def index?
    record.campaign.member?(user)
  end

  def purchase?
    index?
  end

  def purchase_for_user?
    new?
  end
end
