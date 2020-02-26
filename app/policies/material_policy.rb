class MaterialPolicy < ApplicationPolicy

  def update?
    user.teacher?
  end

  def edit?
    update?
  end
end
