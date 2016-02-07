class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    # Stop server and check pry
    # binding.pry
    @recipe = Recipe.find(params[:id])
  end
end
