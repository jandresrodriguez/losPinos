class SessionsController < ApplicationController
  include SessionsHelper
	def new
    if(signed_in?)
      redirect_to '/home'
    end
	end

	def create
  	  user = AdminUser.find_by(usuario: params[:session][:usuario].downcase)
  	  if user && (params[:session][:password] == user.contrasena)
        current_user = user
        redirect_to '/home'
  	  else
      # Create an error message and re-render the signin form.
      	flash[:error] = 'Invalid email/password combination' # Not quite right!
      	render 'new'
  	  end
end

	def destroy

	end
end
