module SessionsHelper

  def current_user=(user)
  	puts "Entro al current user de sessionHelper"
    @current_user = user
  end

  def current_user
    @current_user     # Useless! Don't use this line.
  end

  def signed_in?
  	puts "Entro al signed in y el current_user es #{@current_user}"
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
  end

end
