class Api::V1::FeedbacksController < ApplicationController
  def index
    authorize current_user
    policy_scope(User)
    @course  = Course.find(params[:course_id])
    @course_students = User.where("division_id = ?", @course.division.id).includes([:feedbacks, :division])
    @material = @course.material

    # @sentiment = @course_students.map { |student| {
    #                                                 id: student.id,
    #                                                 sentiment: student.sentiment_score(@course),
    #                                                 grade: student.score(@material)
    #                                               }
    #                                   }

    @messages_students = @course_students.sort_by { |student| student.score(@material) }.map { |student| student.cluster_message_student(@material, @course) }
    # @message_student = @new_course_students.map { |student| student.cluster_message_student(@material, @course) }

    # @messages_students_ordered = @course_students.sort_by { |student| student.score(@material) }
    render json: @messages_students

  end
end
