class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
