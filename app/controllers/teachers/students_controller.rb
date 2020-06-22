class Teachers::StudentsController < ApplicationController

  def index
    authorize current_user
    policy_scope(User)
    @course  = Course.find(params[:course_id])
    @course_students = User.where("division_id = ?", @course.division.id).includes([:feedbacks, :division])
    @material = @course.material

    @new_course_students = @course_students.sort_by { |student| student.score(@material) }

    @list_students_without_top_offender = @new_course_students.drop(5)

  end

  def show
    authorize current_user
  end
end
