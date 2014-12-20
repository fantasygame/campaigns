class PurchasePolicy < ApplicationPolicy
  def toggle_used?
    record.user.id == user.id
  end
end
