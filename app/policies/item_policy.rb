class ItemPolicy < ApplicationPolicy
  def new?
    record.campaign.member?(user)
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def sell
    new?
  end
end
