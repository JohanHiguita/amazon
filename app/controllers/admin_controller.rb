class AdminController < ApplicationController

	before_action :authenticate_user! #viene con devise
	before_action :is_admin?

	layout "admin"

	def index
		@users= User.all
		@subscriptors=Subscriptor.all.order(created_at: :desc)
		@posts = Post.all.order(created_at: :desc)
		@comments = Comment.all
	
	end


	private

	def is_admin?
		unless current_user.admin?
			flash[:alert] = "You do not have permissions"
			redirect_to root_path
		end
	end

end
