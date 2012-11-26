module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !self.current_user.nil?
  end


  # NEW SETTER
  def current_user=(user)
    @current_user = user
  end

  # NEW GETTER
  def current_user
    if @current_user.nil?
      @current_user = User.find_by_remember_token(cookies[:remember_token])
    end
    @current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end


end
