class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def trigger_score_notifications?
    true
  end

  def compute_session_score?
    true
  end

end
