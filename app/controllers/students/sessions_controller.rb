class Students::SessionsController < ApplicationController

  def show
    @sessions_show = true
    authorize current_user
    @session    = Session.find(params[:id])
    division = @session.user.division
    @user = @session.user
    material = @session.chapter.material
    @course = Course.where("division_id = #{division.id}").where("material_id = #{material.id}")[0]
    @flashcards = @session.flashcards
    # TODO : Dans l'index des decks de flashcards, injecter le chapter_id dans les params
    @session_number = @user.sessions.length

    if @session_number < 3
      @exploration = 1
    else
      @exploration = 0.3
    end

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
