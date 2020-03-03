class Teachers::CoursesController < ApplicationController

  def show
    @click_student_list  = params[:click_student_list]
    @click_forum         = params[:click_forum]
    @click_feedback_list = params[:click_feedback_list]
    @notification        = Notification.where('user_id = ? AND course_id = ?', current_user.id, params[:id]).where(notif_type: params[:notif_type])
    if @notification.first
      @notification.first.mark_as_read
    end

    @course  = Course.find(params[:id])
    authorize([:teachers, @course])
    @course_students = User.where("division_id = ?", @course.division.id)
    @chapter_score = {}

    @course.material.chapters.each_with_index do |chapter, index|
      @chapter_score["Chapter #{index + 1}"]  = chapter.score_chapter(@course.division.users.length)
    end
  end

end
