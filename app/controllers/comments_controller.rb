class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		# @post = Post.find(params[:post_id])
		# @comment = @post.comments.new(comment_params)
		#@comment = Comment.new(comment_params)
		# @comment = Comment.new(user_id: 1, post_id: 1, comment:"PRUEBA!")
		# if @comment.save
		# 	flash[:notice]= "Comentario Creado!"
		# 	redirect_to posts_path

		# else
		# 	flash[:alert] = "Falló"
		# 	render :create
		# end
		
		#hecho en clase
		@post =Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params) 
		@comment.user=current_user
		@comment.save
		redirect_to post_path(@post)
	end


	private

	def comment_params
  		params.require(:comment).permit(:comment, :user_id, :post_id) #solo permite estos datos 
  	end

  end


