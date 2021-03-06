class Teachers::CoursesController < ApplicationController

  def show

    @course  = Course.find(params[:id])
    authorize current_user #([:teachers, @course])
    @material = @course.material
    @student_sentiment_score_flashcards_score = {}
    @notification        = Notification.where('user_id = ? AND course_id = ?', current_user.id, params[:id]).where(notif_type: params[:notif_type])
    if @notification.first
      @notification.first.mark_as_read
    end


    @course_students = User.where("division_id = ?", @course.division.id).each do |student|
      score = student.score(@material)
      sentiment = student.sentiment_score(@course)
        if score >= 65 && sentiment >= 50
          @student_sentiment_score_flashcards_score[student.id] = { x: score , y: sentiment, color: "green" }

        elsif score >= 65 && sentiment < 50
          @student_sentiment_score_flashcards_score[student.id] = { x: score , y: sentiment, color: "blue" }

        elsif score < 65 && sentiment >= 50
          @student_sentiment_score_flashcards_score[student.id] = { x: score , y: sentiment, color: "purple" }

        else @student_sentiment_score_flashcards_score[student.id] = { x: score , y: sentiment, color: "red" }
      end
    end

    # Données pour le bar chart

    @chapter_score = {}
    @chapter_cumulative_score = {}
    @cumulative_sum_chapter = 0
    @material.chapters.each_with_index do |chapter, index|
      score_absolute = @course_students.map { |student| student.flashcards_score(chapter) }.sum
      score = (score_absolute / @course_students.length)
      @chapter_score["Chapter #{index + 1}"] = score.round
      @cumulative_sum_chapter += score.round / @material.chapters.length
      @chapter_cumulative_score["Chapter #{index + 1}"]  = @cumulative_sum_chapter
    end

    # Fin score for bar chart

    # Données pour les review - Martin

    @students_feedbacks = []
    @course_students.first(2).each do |student|
      student.feedbacks.each do |feedback|
        @students_feedbacks << feedback if feedback.course == @course
      end
    end

  end

end
