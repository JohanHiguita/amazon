Rails.application.routes.draw do
	root 'home#index' #ir a la página de inicio (se establece una sola vez, solo hay un home)	

	
	#get 'home', to: 'home#index' # evita poner el 'index' en la ruta

	#Rutas sinónimas:
	# get 'home/index'
	get '/home/index', to: 'home#index', as: 'my_alias_path' #(alias)
	#--------------------------------------
	get '/home/:name', to: 'home#hello' #pasando parámetro(name) a una nueva vista (hello)

end
