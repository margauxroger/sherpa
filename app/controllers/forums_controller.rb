class ForumsController < ApplicationController

  def index
    messages
  end

  def show
    authorize current_user
    @course  = Course.where("forum_id = ?", params[:id])
  end

end
