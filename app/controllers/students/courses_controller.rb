class Students::CoursesController < ApplicationController

  def index
    authorize current_user
    @courses = Course.where(dividion_id = 'current_user.division.id')
    policy_scope(@courses)
  end
end
