class SalePolicy < ApplicationPolicy
  def index?
    user_authenticated? && (admin? || manager? || employee?)
  end

  def show?
    user_authenticated? && (admin? || manager? || employee?)
  end
  
  def create?
    user_authenticated? && (admin? || manager? || employee?)
  end

  def cancel?
    user_authenticated? && (admin? || manager? || employee?)
  end




  private

  def user_authenticated?
    user.present?
  end
end