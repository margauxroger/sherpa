class ShowMessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "show_messages_#{params[:forum_id]}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
