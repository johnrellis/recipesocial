class SessionsController < ApplicationController

  def new

  end

  def create
    @email = params[:session][:email].downcase
    user = User.find_by_email(@email)
    if user
      if user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user
      else
        flash[:error] = "Sorry, your password is incorrect"
        render 'new'
      end
      # Sign the user in and redirect to the user's show page.
    else
      flash[:error] = "Sorry, no user exists with the email address #@email"
      render 'new'
    end
  end


  def destroy
    sign_out
    redirect_to root_url
  end

end
