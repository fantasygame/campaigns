class CampaignPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def new?
    create?
  end

  def destroy?
    user == record.game_master
  end

  def update?
    destroy?
  end

  def toggle_membership?
    destroy?
  end

  def manage_members?
    destroy?
  end

  def change_money?
    record.member?(user)
  end
end
