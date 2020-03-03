class Teachers::FlashcardsController < ApplicationController

  def index
    authorize current_user
    policy_scope(Flashcard)
    @materials = []
    @levels = []
    current_user.courses.each { |course| @materials << course.material && @levels << course.division.level}
    @levels = @levels.uniq
    @materials_display = []
  end

end
