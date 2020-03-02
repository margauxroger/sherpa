class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?
  before_action :new_suggestion, only: :show

  def show
    authorize([:teachers, current_user])
    @divisions = current_user.divisions
    @courses = Course.where(user_id: current_user.id)
  end

  def trigger_flashcard_notifications
    authorize(current_user)
    current_user.flashcards_notifications
    redirect_to teachers_root_path
  end

  private

  def new_suggestion

  end

end
