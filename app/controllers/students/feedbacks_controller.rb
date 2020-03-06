class Students::FeedbacksController < ApplicationController

  require 'json'

  def show
    authorize current_user
    @user      = current_user
    @division  = @user.division
    @course    = Course.find(params[:course_id])
    @feedback  = Feedback.where(user_id: @user.id,
                                course_id: @course.id)
    policy_scope(Feedback)
  end

  def new
    authorize current_user
    @course   = Course.find(params[:course_id])
    @feedback = Feedback.new
  end

  def create
    authorize current_user
    @user     = current_user
    @course   = Course.find(params[:course_id])
    @feedback = Feedback.new(params_feedback)
    @feedback.user   = @user
    @feedback.course = @course
    @feedback.sentiment_score = azure_api_launch.AnalyzeSentiment(comment_to_azure_json(@feedback.comment))
    if @feedback.save
      Notification.create!(notif_type: "feedback",
                              content: "You got new feedbacks from #{@course.division.name} for #{course.material.name}",
                            course_id: @course.id,
                              user_id: @user.id)
      redirect_to students_course_path(@course)
    else
      render :new
    end
  end

  def update

  end

  def delete

  end

  private

  def params_feedback
    params.require(:feedback).permit(:comment, :rating)
  end

  def azure_api_launch
    endpoint = "https://sentimentanalysiscalculator.cognitiveservices.azure.com/"
    key      = ENV["COGNITIVE_SERVICE_KEY"]
    TextAnalyticsClient.new(endpoint, key)
  end

  def comment_to_azure_json(text)
    input = MultiLanguageInput.new
    input.id = '1'
    input.language = 'en'
    input.text = text
    inputDocuments =  MultiLanguageBatchInput.new
    inputDocuments.documents = [input]
    return inputDocuments
  end

end
