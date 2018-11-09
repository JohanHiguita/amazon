Rails.application.routes.draw do

	root 'home#index' #ir a la página de inicio (se establece una sola vez, solo hay un home)

	# ---------- Home Routes:
	get '/home/about', to: 'home#about'

	get '/home/contact_us', to: 'home#contact_us'

	get '/home/prices', to: 'home#prices'


	# ------------ Blog Routes:
	get 'blog/index', to: 'blog#index'

	get 'blog/new', to: 'blog#new'

	get 'blog/show', to: 'blog#show'

	get 'blog/edit', to: 'blog#edit'


	#--------------- Admin Routes:
	get 'admin/index'

	get 'admin/show'

	

	
	#get 'home', to: 'home#index' # evita poner el 'index' en la ruta

	#Rutas sinónimas:
	#get 'home/index'
	#get '/home/hello', to: 'home#hello', as: 'my_alias' #(alias)
	#--------------------------------------
	#get '/home/:name', to: 'home#hello' #pasando parámetro(name) a una nueva vista (hello)

end
