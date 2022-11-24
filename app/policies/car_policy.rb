class CarPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all # Restaurant.all
      # if user.admin?
      #   scope.all # admins podem ver tudo
      # else
      #   scope.where(user:) # outros usuários só podem ver o que criaram
      # end
      scope.includes(:sale).where(sales: {id: nil})
    end
  end

  def show?
    true # todos podem ver o car
  end

  def new?
    true
  end

  def create?
    true # todos podem criar um car
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def mycars?
    true
  end

  private

  def owner?
    # verificar se o usuário do restaurate é o usuário logado
    # record = @car
    # record.user = @car.user
    # user = current_user
    record.user == user
  end
end
