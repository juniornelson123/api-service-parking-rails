class ApiController < ApplicationController

	def authenticate

		if request.headers["access-token"].present?

			@user = User.find_by(token: request.headers["access-token"])
			if @user.email
				return
			end
		else
			
			render status: :unprocessable_entity, json: {success: false, info: "Token invalido", data: {} } and return

		end


		rescue
			render status: :unprocessable_entity, json: {success: false, info: "Token invalido", data: {} } and return
	end
end