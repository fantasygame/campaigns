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

  def vote?
    !(!user || Vote.exists?(user: user, post: record) || record.author == user)
  end

  def comment?
    new?
  end

  private

  def author?
    record.author == user
  end
end
