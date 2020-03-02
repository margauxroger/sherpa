class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?
  before_action :new_suggestion, only: :show

  def show
    authorize current_user
    current_user.courses
    @divisions = current_user.divisions
  end

  private
  def new_suggestion
  end
end
