class ForumsController < ApplicationController

  def index
    messages
  end

  def show
    authorize current_user
    @course  = Course.find(params[:course_id])
  end

end
