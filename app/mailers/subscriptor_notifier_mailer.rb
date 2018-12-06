class SubscriptorNotifierMailer < ApplicationMailer
	default from: "hello@amazon-clone.com"

	def new_post_notifying_subscriptor (email, title, id)
		@email = email
		@title =title
		@id = id
		
		@url = "https://amazon-johanhiguita.herokuapp.com/posts/#{@id}" #para producción
		mail to: email, subject: "#{@title} New blog post on Amazon-clone" 
	end
	
end
