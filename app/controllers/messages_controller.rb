class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @currentgroup = Group.find(params[:group_id])

    @messages = @currentgroup.messages
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@message.group_id), notice:"メッセージ送信成功"
    else
      redirect_to group_messages_path(@message.group_id), alert:"メッセージを入力もしくは写真を選択してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end


end
