class Students::SessionsController < ApplicationController

  def show
    authorize current_user
    @session    = Session.find(params[:id])
    @flashcards = @session.flashcards
    # TODO : Dans l'index des decks de flashcards, injecter le chapter_id dans les params
  end

  def create
    authorize current_user
    @session = Session.new(user_id:    current_user.id,
                           chapter_id: params[:chapter_id],)
    @session.save
    redirect_to students_session_path(@session)
  end

  def swipe_right
    authorize current_user
    @session    = Session.find(params[:id])
    @flashcard  = Flashcard.find(params[:flashcard_id])
    UserAnswer.create(session_id:   @session.id,
                      flashcard_id: @flashcard.id,
                      output:       true)
    @flashcards.shift
  end

  def swipe_left
    authorize current_user
    @session    = Session.find(params[:id])
    @flashcard  = Flashcard.find(params[:flashcard_id])
    UserAnswer.create(session_id:   @session.id,
                      flashcard_id: @flashcard.id,
                      output:       false)
    @flashcards.shift
    @flashcards.append(@flashcard)
  end

end
