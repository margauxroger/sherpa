class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?
  before_action :new_suggestion, only: :show

  def show
    authorize([:teachers, current_user])
    @divisions = current_user.divisions
    @courses = current_user.courses
  end

  def trigger_flashcard_notifications
    current_user.flashcards_notifications
  end

  private

  def new_suggestion

  end

end
