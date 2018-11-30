class Subscriptor < ApplicationRecord
	validates :name, :email, presence: true
	validates :email, uniqueness: {message: "El correo ya está registrado"}

	
end
