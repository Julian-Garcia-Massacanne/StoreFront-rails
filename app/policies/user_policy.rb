class UserPolicy < ApplicationPolicy
  def index?
    user_authenticated? && (admin? || manager?)
  end

  def new?
    user_authenticated? && (admin? || manager?)
  end

  def create?
    user_authenticated? &&  (admin? || (manager? && record.role != "admin"))
  end

  def update?
    user_authenticated? &&  (admin? ||
    (manager? && record.role != "admin") ||
    own_account?(record))
  end

  def destroy?
    user_authenticated? &&  (admin? || (manager? && record.role != "admin"))
  end

  private

  def user_authenticated?
    user.present?
  end

end
