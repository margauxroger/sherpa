class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def trigger_flashcard_notifications?
    true
  end
end
