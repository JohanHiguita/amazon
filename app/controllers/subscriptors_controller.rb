class SubscriptorsController < ApplicationController
	protect_from_forgery with: :null_session

	layout "signin"

	def new
		@subscriptor=Subscriptor.new #Pasa los parámetros vacíos	
	end

	def create
		@subscriptor = Subscriptor.new(subscriptor_params)
		respond_to do |format|
			if @subscriptor.save
				#send subscriptor mail
				UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now
				#flash[:notice]= "Suscribed!"


				format.html {redirect_to posts_path, notice: "Se suscribió exitosamente"}
				format.json {render :show, status: :created}
			else
				format.html {render :new, notice: "Hubo un error"}
				format.json {render json: @subscriptor.errors, status: :unprocessable_entity}
			end
		end
	end

	def index
		@subscriptors = Subscriptor.all
		#render json: @subscriptors

		respond_to do |format|
			format.html
			format.json {render json: @subscriptors}
		end
	end

	def show
		@subscriptor=Subscriptor.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @subscriptor}
		end


	end

	def edit
		@subscriptor=Subscriptor.find(params[:id])
	end

	def update
		@subscriptor=Subscriptor.find(params[:id])
		respond_to do |format|
			if @subscriptor.update(subscriptor_params)
				format.html { redirect_to subscriptor_path(@subscriptor)}
				format.json {render :show, status: :ok}
				
			else
				format.html { render :edit}
				format.json {render json: @subscriptor.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@subscriptor =	Subscriptor.find(params[:id])
		@subscriptor.destroy
		respond_to do |format|
			
			format.json { head :no_content }
		end
	end


	private

	def subscriptor_params
 	 params.require(:subscriptor).permit(:name, :email ) #solo permite estos datos 
 	end

 end
