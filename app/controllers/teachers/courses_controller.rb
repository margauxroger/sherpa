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
    authorize current_user #([:teachers, @course])
    @course_students = User.where("division_id = ?", @course.division.id)
    @material = @course.material

    @new_course_students = @course_students.sort_by{ |student| student.score(@material) }
    @list_students_without_top_offender = @new_course_students.drop(5)

    # Score for bar chart

    @chapter_score = {}

    @course.material.chapters.each_with_index do |chapter, index|
      @chapter_score_percentage = (chapter.score_div(@course.division) / @course_students.length) * 100
      @chapter_score["Chapter #{index + 1}"] = @chapter_score_percentage
    end

    # Fin score for bar chart

    # cumulative score for line chart

    @chapter_cumulative_score = {}
    @cumulative_sum_chapter = 0

    @course.material.chapters.each_with_index do |chapter, index|
      @cumulative_sum_chapter += chapter.score_div(@course.division)
      @chapter_cumulative_score["Chapter #{index + 1}"]  = @cumulative_sum_chapter
    end

    # Données pour les review - Martin

    @students_feedbacks = []
    @course_students.each do |student|
      student.feedbacks.each do |feedback|
        @students_feedbacks << feedback if feedback.course == @course
      end
    end

    @students_rating_five_stars = []
    @students_rating_four_stars = []
    @students_rating_three_stars = []
    @students_rating_two_stars = []
    @students_rating_one_stars = []

    @students_feedbacks.each do |feedback|
      if feedback.rating == 5
        @students_rating_five_stars << feedback.rating
      elsif feedback.rating == 4
        @students_rating_four_stars << feedback.rating
      elsif feedback.rating == 3
        @students_rating_three_stars << feedback.rating
      elsif feedback.rating == 2
        @students_rating_two_stars << feedback.rating
      else @students_rating_one_stars << feedback.rating
      end
    end

    @students_rating_five_stars_percentage = @students_rating_five_stars.length.fdiv(@students_feedbacks.length).round(2) * 100
    @students_rating_four_stars_percentage = @students_rating_four_stars.length.fdiv(@students_feedbacks.length).round(2) * 100
    @students_rating_three_stars_percentage = @students_rating_three_stars.length.fdiv(@students_feedbacks.length).round(2) * 100
    @students_rating_two_stars_percentage = @students_rating_two_stars.length.fdiv(@students_feedbacks.length).round(2) * 100
    @students_rating_one_stars_percentage = @students_rating_one_stars.length.fdiv(@students_feedbacks.length).round(2) * 100

    @teacher_reviews = {
      "5 stars" => @students_rating_five_stars_percentage,
      "4 stars" => @students_rating_four_stars_percentage,
      "3 stars" => @students_rating_three_stars_percentage,
      "2 stars" => @students_rating_two_stars_percentage,
      "1 star" => @students_rating_one_stars_percentage
    }

    @sum_reviews = 0
    @students_feedbacks.each do |feedback|
      @sum_reviews += feedback.rating
    end

    @reviews_summary = @sum_reviews / @students_feedbacks.length

    # Fin des données pour les reviews - Martin

    # Données pour le scatterplot - Martin

    @student_sentiment_score_flashcards_score = {}

    @course_students.each_with_index do |student|
      if student.score(@material) >= 60 && student.sentiment_score(@course) >= 70
        @student_sentiment_score_flashcards_score[student.id] = { x: student.score(@material) , y: student.sentiment_score(@course), color: "green" }

      elsif student.score(@material) >= 40 && student.score(@material) < 70 && student.sentiment_score(@course) >= 70
        @student_sentiment_score_flashcards_score[student.id] = { x: student.score(@material) , y: student.sentiment_score(@course), color: "blue" }

      elsif student.score(@material) >= 45 && student.sentiment_score(@course) >= 20 && student.sentiment_score(@course) <= 70
        @student_sentiment_score_flashcards_score[student.id] = { x: student.score(@material) , y: student.sentiment_score(@course), color: "purple" }

      else @student_sentiment_score_flashcards_score[student.id] = { x: student.score(@material) , y: student.sentiment_score(@course), color: "red" }
      end
    end

    # Fin des données pour le scatterplot - Martin

    # Données pour les alerts dans le dash de la classe - Martin

    @unread_flashcards_notifications = Notification.where(user_id: current_user.id).where(notif_type: "flashcards").where(read_status: false)
    @unread_feeling_notifications    = Notification.where(user_id: current_user.id).where(notif_type: "feeling").where(read_status: false)
    @unread_message_notifications    = Notification.where(user_id: current_user.id).where(notif_type: "message").where(read_status: false)

    # Fin des données pour les alerts dash

  end

end
