class Students::UserAnswersController < ApplicationController

  def create
    authorize current_user
    @session = Session.find(params[:session_id])
    @flashcard = Flashcard.find(params[:flashcard_id])
    @output = params[:output]

    @flashcards = @session.flashcards

    @ua = UserAnswer.new(
      session: @session,
      flashcard: @flashcard,
      output: @output
    )

    if @ua.save
      respond_to do |format|
        format.html { redirect_to students_root_path}
        format.js
      end
    end
  end
end
