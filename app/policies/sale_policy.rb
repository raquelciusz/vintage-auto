class SalePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
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
