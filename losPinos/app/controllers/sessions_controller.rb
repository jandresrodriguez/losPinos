class SessionsController < ApplicationController

	def new

	end

	def create
  	  user = AdminUser.find_by(usuario: params[:session][:usuario].downcase)
  	  if user && (params[:session][:password] == user.contrasena)
        redirect_to user
  	  else
      # Create an error message and re-render the signin form.
      	flash[:error] = 'Invalid email/password combination' # Not quite right!
      	render 'new'
  	  end
end

	def destroy

	end
end
