class AdminpageController < ApplicationController
  before_action :authenticate_admin!

  def show
    @admin = Admin.find(params[:id])
  end

  private
  
  def admin_params
    paramsr.require(:user).permit(:email)
  end
  
end
