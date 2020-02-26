class Teachers::CoursePolicy < Teachers::ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user.teacher?
  end
end
