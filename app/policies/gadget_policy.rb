class GadgetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    # NOTE: Be explicit about which records you allow access to!
  end

  def show?
    true
  end
end
