class Message < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  validates :content, presence: true

  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("show_messages_#{forum.id}", {
      message_partial: MessagesController.renderer.render(partial: 'messages/message', locals: { message: self, user_is_message_author: false }),
      current_user_id: user.id
    })
  end

end
