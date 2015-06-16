class HeroPolicy < ApplicationPolicy
  def new?
    record.campaign.member?(user)
  end

  def create?
    new?
  end

  def edit?
    if record.user_character?
      record.user == user
    else
      new?
    end
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def change_money?
    edit?
  end
end
