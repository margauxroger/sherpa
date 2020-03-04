class FlashcardsController < ApplicationController

  def index
    authorize current_user
    @chapter_flash = Flashcard.where("chapter_id = #{params[:chapter_id]}")
    policy_scope(@chapter_flash)
  end
  #   @user = current_user
  #   @materials = []
  #   @levels = []
  #   @courses = Course.where("user_id = '#{@user.id}'")
  #   # current_user.courses.each { |course| @materials << course.material && @levels << course.division.level}
  #   @courses.each { |course| @materials << course.material && @levels << course.division.level}

  #   @levels = @levels.uniq
  #   @materials_display = []
  # end

  # def create
  #       authorize current_user

  #   @flashcard = Flashcard.new(params_flash)
  #   @flashcard.chapter = Chapter.find(params[:chapter_id])
  #   if @flashcard.save
  #     redirect_to teachers_flashcards_path
  #   else
  #     render :new
  #   end
  # end

  # private

  # def params_flash
  #   params.require(:flashcard).permit(:question, :answer)
  # end

end
