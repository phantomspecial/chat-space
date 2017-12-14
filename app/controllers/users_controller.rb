class UsersController < ApplicationController

  def index
    @users = User.where('name Like(?)' , "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to :root , notice: "ユーザ情報の更新に成功しました。"
    else
      render :edit , alert: "ユーザ情報の更新に失敗しました。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
