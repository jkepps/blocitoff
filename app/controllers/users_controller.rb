class UsersController < ApplicationController
	# before_action :require_sign_in
	before_action :authenticate_user!

	def show
		@user = current_user
	end
end
