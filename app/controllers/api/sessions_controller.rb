class Api::SessionsController < ApplicationController
	def sign_in
		@user = User.find_by_email(params[:user][:email])

	    if @user.present? && @user.valid_password?(params[:user][:password])
	      
	      @user.update_column(:token, User.generate_authentication_token)
	      warden.set_user @user

	      render json: @user.to_json( include: { parking: { except: [:created_at] }})
	      
	      

	    else
	      	render :status => 401, json: {
	          success: false,
	          info: "Email ou Senha invalidos",
	          data: {}
	     	}
    end
	end

	def sign_up
		@user = User.new(users_params)
		if @user.save
			
			@user.update_column(:token, User.generate_authentication_token)
			render json:{
				user: @user,
		        access_token: @user.token
			}
		else
			render :status => 401, json: {
	          success: false,
	          info: "Falha ao cadastrar",
	          data: @user.errors.full_messages.join(", "),
	     	}

		end
	end

	def sign_out
		
	end

	private
		def users_params
			params.require(:user).permit!
		end
end