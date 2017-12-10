class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice:"グループ作成完了"
    else
      render :new, alert: "グループ作成失敗"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice:"グループ編集完了"
    else
      render :edit, alert:"グループ編集失敗"
    end
  end



  private
  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end

end
