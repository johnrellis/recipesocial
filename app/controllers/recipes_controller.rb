class RecipesController < ApplicationController
  before_filter :signed_in_user

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(params[:recipe])
    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @recipe = current_user.recipes.find_by_id(params[:id])
    @recipe.destroy
    redirect_to root_url
  end

end
