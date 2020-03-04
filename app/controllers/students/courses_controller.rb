class Students::CoursesController < ApplicationController

  def index
    @user = current_user
    authorize @user
    div_id = @user.division.id
    @courses = Course.where("division_id = #{div_id}")
    policy_scope(@courses)
    @user_score = {}
    @user.division.courses.each do |course|
      @user_score[course.material.name] = @user.score(course.material)
    end

  end

  def show
    @course = Course.find(params[:id])
    authorize current_user
  end

  def show
    authorize current_user
    @course = Course.find(params[:id])
  end
end
