class RecipesController < ApplicationController

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

end
