class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    #DailyNotifier.notify.deliver
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @recipes = @user.recipes
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

end
