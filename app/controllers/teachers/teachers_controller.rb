class Teachers::TeachersController < ApplicationController
  include Pundit
  # before_action :verify_authorized, except: :show, unless: :skip_pundit?

  def show
    authorize([:teachers, current_user])
    current_user.courses
  end

end
