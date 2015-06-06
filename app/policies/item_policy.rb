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

  def sell?
    return false if record.sold?
    hero_item?
  end

  def reclaim?
    return false unless record.sold?
    hero_item?
  end

  private

  def hero_item?
    if record.hero.present?
      record.hero.user == user
    else
      new?
    end
  end
end
