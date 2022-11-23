class SalePolicy < ApplicationPolicy
  def create?
    record.user.present?
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end
end
