class StylesController < ApplicationController
  
  def show
    @style = Style.find(params[:id])
    perPage = 4
    @recipes = @style.recipes.paginate(page: params[:page], per_page: perPage)
  end
  
  def new
  @style = Style.new
  end
  
  def create
    @style = Style.new(style_params)
    
    if @style.save
      flash[:success] = "Style was created successfully"
      redirect_to recipes_path
    else
      render 'new'
    
    end
    
  end
  
  private
    def style_params
      params.require(:style).permit(:name)
    end
end
