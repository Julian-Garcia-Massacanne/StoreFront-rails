class ProductPolicy < ApplicationPolicy
  def index?
    admin? || manager? || employee?
  end

  def create?
    admin? || manager? || employee?
  end

  def update?
    admin? || manager? || employee?
  end

  def destroy?
    admin? || manager? || employee?
  end
end
