class UsersController < ApplicationController
	before_action :fetch_user, only: [:show, :update]

	def update
		if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "User was successfully updated"
    else
      render :edit
      flash[:alert] = "User was failed to update"
    end
	end

	private
	
	def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def fetch_user
		@user = User.find(params[:id])
	end
end
