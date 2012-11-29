class StaticPagesController < ApplicationController
  def home
    #user shouldn't be here unless they are signed in
    redirect_to signin_path unless current_user
    #initialize a micropost for posting from the homepage
    @micropost = current_user.microposts.build if signed_in?
  end

  def help
  end

  def about
  end

  def signin
    #if the user is already signed in, send them to root
    redirect_to root_path if current_user
  end

end
