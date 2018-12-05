class UserNotifierMailer < ApplicationMailer
	default from: "hello@amazon-clone.com"

	#send a subscribe email to the user

	def send_subscribe_email (subscriptor)
		@subscriptor= subscriptor #subscriptor
		@subject = "Thanks for subscribe for our amazin up"
		mail(to: @subscriptor.email, subject: @subject)
		#mail(to:, from:, subject:)
	end
end
