class Students::ForumsController < ApplicationController
  def show
    authorize current_user
  end
end
