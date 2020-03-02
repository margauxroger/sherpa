class Teachers::CoursesController < ApplicationController

  def show
    @course  = Course.find(params[:id])
    authorize([:teachers, @course])
    @course_students = User.where("division_id = ?", @course.division.id)
    @material = @course.material

    @new_course_students = @course_students.sort_by{ |student| student.score(@material) }
    @list_students_without_top_offender = @new_course_students.drop(5)


  end

end
