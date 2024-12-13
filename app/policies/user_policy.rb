class UserPolicy < ApplicationPolicy
  def index?
    admin? || manager?
  end

  def new?
    admin? || manager?
  end

  def create?
    admin? || (manager? && record.role != "admin")
  end

  def update?
    admin? ||
    (manager? && record.role != "admin") ||
    own_account?(record)
  end

  def destroy?
    admin? || (manager? && record.role != "admin")
  end


end
