class MessagesController < ApplicationController

  def create
    authorize current_user
    @message = Message.new(params_message)
    @forum = Forum.find(params[:forum_id])
    @course = @forum.course
    @message.forum = @forum
    # if @message.save
    #   redirect_to materials_path
    # else
    #   render 'shared/navbar_left'
    # end

    if @message.save
      Notification.create!(notif_type: "message",
                             content: "You have unread messages from your students in #{@course.division.name}.",
                           course_id: @course.id,
                             user_id: @course.user.id)
      respond_to do |format|
        format.html { redirect_to materials_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'shared/navbar_left' }
        format.js  # <-- idem
      end
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
