class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true  # Anyone can view a post
  end

  def create?
    true  # Anyone can create a post
  end

  def update?
    record.user == user  # Only post creator can update it
  end

  def destroy?
    record.user == user  # Only post creator can delete it
  end
end
