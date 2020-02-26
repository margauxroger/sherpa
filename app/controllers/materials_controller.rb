class MaterialsController < ApplicationController
  include Pundit

  def index
    @teacher = current_user
    authorize @teacher
    policy_scope(Material)
  end

  def show
    @teacher = current_user
    authorize @teacher
    policy_scope(Material)
  end

end

