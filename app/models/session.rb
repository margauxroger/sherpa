class Session < ApplicationRecord
  belongs_to :user
  belongs_to :chapter
  has_many :user_answers
  has_many :flashcards, through: :chapter

  def analyse_answers
    # Returns a hash with all flashcards of the session as keys and their level of mastery by user as values
    flashcards_mastery = {}
    self.chapter.flashcards.each do |flashcard|
      flashcard_answers = self.user_answers.where(flashcard_id: flashcard.id)
      flashcard_bad_answers = flashcard_answers.where(output: false)
      if flashcard_bad_answers.length >= 2
        flashcards_mastery[flashcard.id] = "not mastered"
      elsif flashcard_bad_answers.length == 1
        flashcards_mastery[flashcard.id] = "learning"
      else
        flashcards_mastery[flashcard.id] = "mastered"
      end
    end
    return flashcards_mastery
  end

  def score
    flashcards_mastery = analyse_answers
    flashcards_scores = flashcards_mastery.values.map do |flashcard_mastery|
      if flashcard_mastery == "not mastered"
        0
      elsif flashcard_mastery == "learning"
        0.5
      else
        1
      end
    end
    flashcards_scores.sum.fdiv(self.chapter.flashcards.length) * 100
  end
end
