class PostPolicy < ApplicationPolicy
  def new?
    record.game.member?(user)
  end

  def create?
    new?
  end

  def update?
    author?
  end

  def edit?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    record.author == user
  end
end
