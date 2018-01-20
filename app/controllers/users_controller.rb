class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

  # private

  # def fetch_user
	# 	@user = User.find(params[:id])
	# end
end
