class GamePolicy < ApplicationPolicy
  def new?
    record.member?(user)
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def destroy?
    record.game_master?(user)
  end
end
