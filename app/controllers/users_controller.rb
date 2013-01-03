class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @micropost = current_user.microposts.build if signed_in?
    @microposts = @user.microposts
    @recipes = @user.recipes
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Recipe Social!"
      redirect_to root_path
    else
      render 'new'
    end
  end

end
