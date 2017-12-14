class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @currentgroup = Group.find(params[:group_id])

    @messages = @currentgroup.messages

    @message = current_user.messages.new

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to group_messages_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end
end
