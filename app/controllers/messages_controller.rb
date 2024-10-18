class MessagesController < ApplicationController
  def index
  #   # sender_id = params[:sender_id]
  #   # receiver_id = params[:receiver_id]
  #   # @messages = Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", sender_id, receiver_id, receiver_id, sender_id).order(created_at: :asc)
  #   # @bookings = Booking.where(user: current_user)
  #   @messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id).order(created_at: :asc)
  #   render json: @messages
    @messages = Message.all
    puts @messages.size
    @messages.each do |message|
      puts message.content
    end
  end

  def new
    @message = Message.new
    @receiver_id = params[:receiver_id]
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversation_with_user(@message.receiver_id), notice: 'Message was successfully sent.'
    else
      render :new
    end
  end

  def show_conversation
    id1 = current_user.id.to_s
    id2 = params[:receiver_id]

    @messages = Message.where("sender_id IN (?) AND receiver_id IN (?)", [id1, id2], [id1, id2])
    @other_user = User.find(id2)
    @messages.each do |message|
      puts(message.sender_id)
    end
    @new_message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :content)
  end

  def conversation_with_user(receiver_id)
    "/messages/conversation/#{receiver_id}"
  end
end
