class CampaignPolicy < ApplicationPolicy
  def destroy?
    user == record.game_master
  end

  def update?
    destroy?
  end

  def create?
    record.member?(user)
  end

  def toggle_membership?
    user.present?
  end
end
