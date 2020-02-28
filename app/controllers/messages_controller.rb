class MessagesController < ApplicationController

  def create
    authorize current_user
    @message = Message.new(params_message)
    @forum = Forum.find(params[:forum_id])
    @message.forum = @forum
    if @message.save
      redirect_to materials_path
    else
      render 'shared/navbar_left'
    end
  end

  def index
    @messages = Message.where("forum_id = #{params[:forum_id]}")
  end

  private

  def params_message
    params.require(:message).permit(:content, :user_id)
  end

end
