class AddSentimentScoreToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :sentiment_score, :float
  end
end
