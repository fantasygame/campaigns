class HeroPolicy < ApplicationPolicy
  def new?
    record.campaign.member?(user)
  end

  def create?
    new?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
