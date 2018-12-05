class SubscriptorsController < ApplicationController

	layout "signin"

	def new
		@subscriptor=Subscriptor.new #Pasa los parámetros vacíos	
	end

	def create
		@subscriptor = Subscriptor.new(subscriptor_params)
		if @subscriptor.save

			#send subscriptor mail
			UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now
			#flash[:notice]= "Suscribed!"
			redirect_to posts_path, notice: "Se suscribió exitosamente"

		else
			#flash[:alert] = "Error al suscribirse!"
			render :new
		end
	end

	private

	def subscriptor_params
 	 params.require(:subscriptor).permit(:name, :email ) #solo permite estos datos 
 	end

end
