class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.new
    @asker = current_user
    @chatroom.asker = @asker
    @receiver = User.find(params[:receiver_id])
    @chatroom.receiver = @receiver
    @chatroom.name = "New Chatroom #{@chatroom.id}"
    if Chatroom.exists?(receiver: @receiver, asker: @asker) || Chatroom.exists?(receiver: @asker, asker: @receiver)
      exist_chatroom = Chatroom.find_by(receiver: @receiver, asker: @asker) || Chatroom.find_by(receiver: @asker, asker: @receiver)
      redirect_to chatroom_path(exist_chatroom)
    else
      @chatroom.save
      redirect_to chatroom_path(@chatroom)
    end
    authorize @chatroom
  end

end
