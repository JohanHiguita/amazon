class HomeController < ApplicationController
  def index
  	#comunicación con la BBDD
  	#Variables de instancio que se pueden renderizar en la vista:
  	#Asume que hay un view lamado "index" y va allá
  	@hola="Hello world"

  	#otra forma de renderizar:

  	#render html: "<h1>Hello world</h1>".html_safe #no es buena practica

  end

  def about 
   
  end

  def contact_us

  end

  def prices

  end

end
