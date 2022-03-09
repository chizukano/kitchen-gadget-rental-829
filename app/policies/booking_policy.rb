class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(customer: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end
end
