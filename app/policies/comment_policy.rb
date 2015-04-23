class CommentPolicy < ApplicationPolicy
  def new?
    record.post.member?(user)
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
