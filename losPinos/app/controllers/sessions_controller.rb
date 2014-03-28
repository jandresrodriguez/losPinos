class SessionsController < ApplicationController

	def new

	end

	def create
  	  user = AdminUser.find_by(email: params[:session][:email].downcase)
  	  if user && user.authenticate(params[:session][:password]) && false
      # Sign the user in and redirect to the user's show page.
  	  else
      # Create an error message and re-render the signin form.
      	flash[:error] = 'Invalid email/password combination' # Not quite right!
      	render 'new'
  	  end
end

	def destroy

	end
end
