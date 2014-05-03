class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :authorize


  protected

  def authorize
  		unless AdminUser.find_by(id: session[:user_id])
  			redirect_to login_path, notice: "Please log in"
  		end
  end
end
