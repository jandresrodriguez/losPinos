module SessionsHelper

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user     # Useless! Don't use this line.
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
  end

end
