class ItemPolicy < ApplicationPolicy
  def new?
    record.campaign.member?(user)
  end

  def create?
    new?
  end

  def edit?
    hero_item?
  end

  def update?
    hero_item?
  end

  def destroy?
    hero_item?
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
