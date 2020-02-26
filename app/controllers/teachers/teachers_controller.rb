class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?

  def show
    @teacher = current_user
    authorize @teacher
  end

end
