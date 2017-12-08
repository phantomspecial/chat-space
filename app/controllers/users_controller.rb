class UsersController < ApplicationController

  def edit
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
