class Teachers::UserPolicy < Teachers::ApplicationPolicy

  def show?
    user.teacher?
  end

end
