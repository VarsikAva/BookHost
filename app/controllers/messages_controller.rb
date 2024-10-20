class MessagesController < ApplicationController
  def index
    @conversations = group_messages_by_user
  end

  def new
    @message = Message.new
    @receiver_id = params[:receiver_id]
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversation_with_user_path(@message.receiver_id), notice: 'Message was successfully sent.'
    else
      render :new
    end
  end

  def show_conversation
    id1 = current_user.id.to_s
    id2 = params[:receiver_id]

    @messages = Message.where("sender_id IN (?) AND receiver_id IN (?)", [id1, id2], [id1, id2])
    print @messages.size
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

  def conversation_with_user_path(receiver_id)
    "/messages/conversation/#{receiver_id}"
  end

  def group_messages_by_user
    # Find all messages sent or received by the current user
    current_user_messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    # If no messages yet, return empty array
    return [] if current_user_messages.empty?

    # Group messages by the other user we talk to
    # Returns a hash with user_id: [messages]
    grouped_messages = current_user_messages.group_by { |message| message.sender_id == current_user.id ? message.receiver_id : message.sender_id }
    return grouped_messages.map do |user_id, messages|
      # For each user, return the other user, the last message and the path to the conversation
      {
        other_user: User.find(user_id),
        last_message: messages.last,
        path: conversation_with_user_path(user_id)
      }
    end
  end
end
