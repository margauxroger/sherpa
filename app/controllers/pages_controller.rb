class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #create a deck
    @deck = Anki::Deck.new('FancyExampleDeck')

    #create a basic card
    @card = Anki::Card.new(front: "What is the solution for 3x+5 = 8?", back: "1")

    #add card to the deck
    @deck.add_card(@card)

    #export to ~/Anki/Decks/FancyExampleDeck.apkg
    Anki::apkg.export @deck, "./Anki/Decks"

  end
end
