class V1::SessionsController < ApplicationController
	protect_from_forgery with: :null_session #CSRF Exception
	def create
		user = User.where(email: params[:email]).first

		if user&.valid_password?(params[:password])
			render json: user.as_json(only: [:email, :authentication_token]), status: :created
		else
			head(:unauthroized)
		end
	end

	def destroy
		
	end
end