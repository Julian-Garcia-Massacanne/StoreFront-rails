class UserPolicy < ApplicationPolicy
  def index?
    admin? || manager?
  end

  def create?
    admin? || (manager? && record.role != "administrador")
  end

  def update?
    admin? ||
    (manager? && record.role != "administrador") ||
    own_account?(record)
  end

  def destroy?
    admin? || (manager? && record.role != "administrador")
  end


  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
