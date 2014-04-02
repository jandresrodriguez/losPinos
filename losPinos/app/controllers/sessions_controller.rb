class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :authorize, only: [:create, :new]
	def new
    puts "Entro al new de session"
    if(session[:user_id])
      redirect_to '/home'
    end
	end

	def create
  	  user = AdminUser.find_by(usuario: params[:session][:usuario].downcase)
  	  if user && (params[:session][:password] == user.contrasena)
        session[:user_id] = user.id
        redirect_to '/home'
  	  else
      # Create an error message and re-render the signin form.
      	redirect_to login_path, notice: "Invalid email/password combination"
  	  end
end

	def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
	end
end
