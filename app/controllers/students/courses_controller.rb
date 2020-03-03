class Students::CoursesController < ApplicationController

  def index
    @user = current_user
    authorize @user
    div_id = @user.division.id
    @courses = Course.where("division_id = #{div_id}")
    policy_scope(@courses)
  end
end
