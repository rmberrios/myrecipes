class CommentsController < ApplicationController
  before_action :set_recipe, only: [:create]
  before_action :require_user_back, only: [:create]
  
  def create
    @comment = Comment.create(comment_params)
    @comment.recipe = @recipe
    @comment.chef = current_user
    
    if @comment.save
     flash[:success] = "Your Comment was created successfully! "
     redirect_to recipe_path(@recipe)
    else
      flash[:success] = "Your Comment was error #{@comment.errors.messages} successfully!"
     
       redirect_to recipe_path(@recipe)
    end
  end
  
  private
    def comment_params
      params.require(:comment)
      .permit(:body)
    end
    
    def set_recipe 
      @recipe = Recipe.find(params[:id])
    end
end