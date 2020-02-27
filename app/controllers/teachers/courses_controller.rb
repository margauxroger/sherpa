class Teachers::CoursesController < ApplicationController

  def show
    @course  = Course.find(params[:id])
    authorize([:teachers, @course])
    @course_students = User.where("division_id = ?", @course.division.id)


  end

end
