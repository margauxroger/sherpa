class Students::ForumsController < ApplicationController
  def show
    authorize current_user
    @course = Course.find(params[:id])
  end
end
