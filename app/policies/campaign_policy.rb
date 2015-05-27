class CampaignPolicy < ApplicationPolicy
  def destroy?
    user == record.game_master
  end

  def update?
    destroy?
  end

  def toggle_membership?
    record.member?(user)
  end

  def manage_members?
    toggle_membership?
  end
end
