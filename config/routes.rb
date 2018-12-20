Rails.application.routes.draw do
	root 'home#index'	
	get 'order_items/create'
	get 'order_items/update'
	get 'order_items/destroy'
	get 'carts/show'
	#root 'posts#index' #ir a la página de inicio (se establece una sola vez, solo hay un home)
	# resources :posts
	resources :posts do
		resources :comments, only: [:create]
		member do
			patch :publish
		end
	end

	

	get "admin", to: 'admin#index'
	get 'admin/products', to: 'admin#products'

	resources :products, only: [:index, :new, :create]
	resources :subscriptors
	resource :cart, only: [:show]
	resources :order_items, only: [:create, :update, :destroy]
	

	

	# post '/comments/:id_post', to 'comments/create'#ruta que me crea un comenario
	# ---------- Home Routes:
	# get '/home/about', to: 'home#about'

	# get '/home/contact_us', to: 'home#contact_us'

	# get '/home/prices', to: 'home#prices'


	# # ------------ Blog Routes:
	# get 'blog/index', to: 'blog#index'

	# get 'blog/new', to: 'blog#new'

	# get 'blog/show', to: 'blog#show'

	# get 'blog/edit', to: 'blog#edit'


	# #--------------- Admin Routes:
	# get 'admin/index'

	# get 'admin/show'

	#Devise
	devise_for :users

	

	
	#get 'home', to: 'home#index' # evita poner el 'index' en la ruta

	#Rutas sinónimas:
	#get 'home/index'
	#get '/home/hello', to: 'home#hello', as: 'my_alias' #(alias)
	#--------------------------------------
	#get '/home/:name', to: 'home#hello' #pasando parámetro(name) a una nueva vista (hello)

end
