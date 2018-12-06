class PostsController < ApplicationController

#El usuario debe estar logueado para editar los detalles (edit method)
before_action :authenticate_user!, except: [:index, :show] 

#El usuario logeado no puede  editar, actualiza ni elminar los posts de otros users
#before_action :validate_user, only: [:edit, :update, :destroy]

before_action :is_admin?, only: [:edit, :update, :destroy] 


def index
  #@user=current_user
  #@posts=Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)

  if params[:category].blank?
   @posts=Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
   @jumbotron=true
   @last_post = Post.last
   @shoes_category = Category.find_by(name: "Shoes")
   @last_post_shoes = @shoes_category.posts.last
   @glasses_category = Category.find_by(name: "Glasses")
   @last_post_glasses = @glasses_category.posts.last
 else
  @category_id=Category.find_by(name: params[:category]).id
  @posts = Post.where(category_id: @category_id)
  .order(created_at: :desc)
  .paginate(page: params[:page], per_page: 2)

  @jumbotron=false
end


end

def new

  @post=Post.new
end

def show

  @post=Post.find(params[:id])
  @comments=@post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 1)

end

def edit
  @post=Post.find(params[:id])
end

def destroy

  post = Post.find(params[:id])
  post.destroy
  flash[:notice]="El post fue eliminado exitosamente"
  redirect_to posts_path
end

def create

  @post = Post.new(post_params)
  @post.user = current_user
  if @post.save

    title=@post.title
    id=@post.id
    users = User.where(role: "user")
    users.each do |user|
      user_email = user.email
      UserNotifierMailer.new_post_notifying_user(user_email, title, id).deliver_now
    end

    
    flash[:notice]= "Creado!"
    redirect_to posts_path

  else
    flash[:alert] = "Falló"
    render :new
  end
end


def update
  @post=Post.find(params[:id])
  if @post.update(post_params)
    flash[:notice]= "Editado!"
    redirect_to posts_path  
  else
    flash[:alert] = "Falló"
    render :edit
  end
end


private

def post_params
  params.require(:post).permit(:user_id, :title, :content, :category_id) #solo permite estos datos
  
end


def validate_user
  unless current_user.posts.ids.to_s.include? params[:id]
    redirect_to root_path
    flash[:alert] = "You do not have permissions"
  end
end

def is_admin?
  unless current_user.admin?
    flash[:alert] = "You do not have permissions"
    redirect_to root_path
  end
end

end