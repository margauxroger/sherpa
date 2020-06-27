class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?

  def show
    authorize current_user

    # @divisions = current_user.divisions
    @courses = Course.where(user_id: current_user.id)
    # @courses.each { |course| course.division.users.map { |student| student.score(course.material)}}
    # @courses_students = @courses.map { |course| User.where("division_id = ?", course.division.id) }
    # @test = @courses_students.map do |students|
    #   students.map { |student| student.sessions.map { |session| session.score }.sum }.sum
    # end

    # @number_of_flash = course.material.chapter.flashcards.length
    # @course_student = User.where("division_id = ?", course.division.id)

    @success_rate = @courses.map do |course|
      # users = course.division.users
      # users.map do |student|
      #   student.score(course.material)
      # end
      # .sum / users.length
      course.division_sentiment_score
    end

    @unread_flashcards_notifications = Notification.where(user_id: current_user.id).where(notif_type: "flashcards").where(read_status: false).includes([:course])
    @unread_feeling_notifications    = Notification.where(user_id: current_user.id).where(notif_type: "feeling").where(read_status: false).includes([:course])
    @unread_message_notifications    = Notification.where(user_id: current_user.id).where(notif_type: "message").where(read_status: false).includes([:course])
    @unread_feedback_notifications   = Notification.where(user_id: current_user.id).where(notif_type: "feedback").where(read_status: false).includes([:course])
  end

  def trigger_score_notifications
    authorize(current_user)
    current_user.flashcards_notifications
    current_user.feeling_notifications
    redirect_to teachers_root_path
  end

end
