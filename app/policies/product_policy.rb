class ProductPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user_authenticated? && (admin? || manager? || employee?)
  end

  def update?
    user_authenticated? && (admin? || manager? || employee?)
  end

  def destroy?
    user_authenticated? && (admin? || manager? || employee?)
  end


  private

  def user_authenticated?
    user.present?
  end
end
