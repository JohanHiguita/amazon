class UserNotifierMailer < ApplicationMailer
	default from: "hello@amazon-clone.com"

	#send a subscribe email to the user

	def send_subscribe_email (subscriptor)
		@subscriptor= subscriptor #subscriptor
		@subject = "Thanks for subscribe for our amazin up"
		mail(to: @subscriptor.email, subject: @subject)
		#mail(to:, from:, subject:)
	end

	def new_post_notifying(email, title, id, type_user)
		@email = email
		@title =title
		@id = id
		#@url ="http://localhost:3000/posts/#{@id}"
		@url = "https://amazon-johanhiguita.herokuapp.com/posts/#{@id}" #para producción
		mail to: email, subject: "#{@title} - #{type_user} New blog post on Amazon-clone" 
	end

	def edit_post_notifying(email, title, id, type_user)
		@email = email
		@title =title
		@id = id
		#@url ="http://localhost:3000/posts/#{@id}"
		@url = "https://amazon-johanhiguita.herokuapp.com/posts/#{@id}" #para producción
		mail to: email, subject: "#{@title} - #{type_user} Edited blog post on Amazon-clone" 
	end


end
