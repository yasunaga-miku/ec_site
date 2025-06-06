class MypageController < ApplicationController
  before_action :authenticate_user!

  def show
    #指定されたIDのユーザ情報を取得
    @user = User.find(params[:id])
  end

  private

  #許可するユーザ情報のパラメータ
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
