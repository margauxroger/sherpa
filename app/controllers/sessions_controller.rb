class SessionsController < ApplicationController
  def show

  end

  def create
    @session = Session.new(user_id:    current_user.id,
                           chapter_id: params[:chapter_id],)
    # TODO : Dans l'index des decks de flashcards, injecter le chapter_id dans les params
  end

  private

end
