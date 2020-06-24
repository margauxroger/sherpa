class Api::V1::MaterialsController < ApplicationController

  def index
    authorize current_user
    policy_scope(User)
    @student = User.find(params[:student_id])
    @course = Course.find(params[:course_id])
    @material = @course.material

    @student_grades = @student.flashcards_score_student(@material)

    render json: @student_grades
  end

end
