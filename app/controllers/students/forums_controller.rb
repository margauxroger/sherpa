class Students::ForumsController < ApplicationController
  def show
    authorize current_user
    @course = Course.find(params[:course_id])
    @forum = Forum.find(params[:id])
  end
end
