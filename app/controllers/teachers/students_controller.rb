class Teachers::StudentsController < ApplicationController

  def index
    authorize current_user
    policy_scope(User)
    @course  = Course.find(params[:course_id])
    @course_students = User.where("division_id = ?", @course.division.id)
    @material = @course.material

    @new_course_students = @course_students.sort_by { |student| student.score(@material) }.first(5).each { |student| student["last_name"] = student.border_color(@material) ; student["email"] = student.cluster_message_student(@course)}
  end

end
