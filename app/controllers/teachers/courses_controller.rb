class Teachers::CoursesController < ApplicationController

  def show
    @course  = Course.find(params[:id])
    authorize([:teachers, @course])
  end

end
