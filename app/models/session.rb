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
    flashcards_scores.sum
  end

  def memory_type
    flashcards_mastery = Hash.new { |h,k| h[k] = {} }
    self.chapter.flashcards.each do |flashcard|
      flashcard_answers = self.user_answers.where(flashcard_id: flashcard.id)
      flashcard_bad_answers = flashcard_answers.where(output: false)
      if flashcard_bad_answers.length >= 2
        flashcards_mastery["#{flashcard_answers.last.image ? "image" : "text"}"][flashcard.id] = "not mastered"
      elsif flashcard_bad_answers.length == 1
        flashcards_mastery["#{flashcard_answers.last.image ? "image" : "text"}"][flashcard.id] = "learning"
      else
        flashcards_mastery["#{flashcard_answers.last.image ? "image" : "text"}"][flashcard.id] = "mastered"
      end
    end
      flashcards_with_image_scores = flashcards_mastery["image"].values.map do |flashcard_mastery|
        if flashcard_mastery == "not mastered"
          0
        elsif flashcard_mastery == "learning"
          0.5
        else
          1
        end
      end
      flashcards_with_text_scores = flashcards_mastery["text"].values.map do |flashcard_mastery|
        if flashcard_mastery == "not mastered"
          0
        elsif flashcard_mastery == "learning"
          0.5
        else
          1
        end
      end
    memory_results = {image: flashcards_with_image_scores.sum / (flashcards_mastery["image"].values.length == 0 ? 1 : flashcards_mastery["image"].values.length),
                      text: flashcards_with_text_scores.sum / (flashcards_mastery["text"].values.length == 0 ? 1 : flashcards_mastery["text"].values.length) }
    return memory_results
  end

  def update_memory
    latest_memory = memory_type
    # essayer de weighter pour donner plus de poid à la derniere session
    if self.user.memory == {}
      self.user.memory[:image] = latest_memory[:image]
      self.user.memory[:text] = latest_memory[:text]
    else
      self.user.memory[:image] += (self.user.memory[:image] + latest_memory[:image]) / self.user.sessions.length
      self.user.memory[:text] += (self.user.memory[:text] + latest_memory[:text]) / self.user.sessions.length
    end
  end

end
