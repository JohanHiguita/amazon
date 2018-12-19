class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller? #rol de ususario
	layout :layout_by_resource

	helper_method :current_order

	def current_order

		if session[:order_id]

			Order.find(session[:order_id])
		else
			
			Order.new
		end
		
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role]) 

		devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

	def layout_by_resource
		if devise_controller?
			"signin"
		else
			"application"
		end
	end
end
