class MaterialsController < ApplicationController
  include Pundit

  def index
    @teacher = current_user
    authorize @teacher
    policy_scope(Material)
    @chapter = Chapter.new
    @materials = []
    @teacher.courses.each { |course| @materials << course.material }
  end

  def show
    @teacher = current_user
    authorize @teacher
    policy_scope(Material)
    @material= Material.find(params[:id])
  end

  # def new
  #   @course  = Course.find(params[:id])
  #   @chapter = Chapter.new
  # end

end

