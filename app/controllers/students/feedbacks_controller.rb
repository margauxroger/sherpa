class Students::FeedbacksController < ApplicationController

  def index
    authorize current_user
    @user      = current_user
    @division  = @user.division
    @courses   = @division.courses
    @feedbacks = current_user.feedbacks
    @feedback  = Feedback.new

    policy_scope(Feedback)
  end

  def create
    @feedback = Feedback.new(params_feedback)
    if @cocktail.save
      redirect_to students_course_feedbacks_path(params[:id])
    else
      render :index
    end
  end

  def update

  end

  def delete

  end

  private

  def params_feedback
    params.require(:feedback).permit(:comment, :rating, :course_id, :user_id)
  end

end
