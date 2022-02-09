# class PostPolicy < ApplicationPolicy
#   # class Scope < Scope
#   #   def resolve
#   #     scope.all
#   #   end
#   # end
#
# end
class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    user.admin?
  end

  def created?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end