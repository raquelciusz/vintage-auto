class SalePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:)
    end
  end

  def show?
    record.user == user || record.car.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user || record.car.user == user
  end
end
