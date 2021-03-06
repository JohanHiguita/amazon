class AdminController < ApplicationController

	before_action :authenticate_user! #viene con devise
	before_action :is_admin?
	def index
		@users= User.all
		@subscriptors=Subscriptor.all.order(created_at: :desc)
		@posts = Post.all.order(created_at: :desc)
		@comments = Comment.all
	
	end

	def products
		@products= Product.all.order(created_at: :desc)
		@prueba="Hoe"
	end


	private

	def is_admin?
		unless current_user.admin?
			flash[:alert] = "You do not have permissions"
			redirect_to root_path
		end
	end

end
