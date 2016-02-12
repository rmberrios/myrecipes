class ChefsController < ApplicationController

def index
  per_page = 3
  @chefs = Chef.paginate(page: params[:page], per_page: per_page)
end


def new
  @chef = Chef.new
end

def create
  @chef = Chef.new(chef_params)
  if @chef.save
    flash[:success] = "Your Account has been created successfully"
    session[:chef_id] = @chef.id
    redirect_to recipes_path
  else
    render 'new'
  end
  
end

def edit
  @chef = Chef.find(params[:id])
end

def update
  @chef = Chef.find(params[:id])
  if @chef.update(chef_params)
    flash[:success] = "Your profile has been updated successfully"
    redirect_to recipes_path # TODO change to show chef page
  else
    render "edit"
  end
end

def show
  per_page = 3
  @chef = Chef.find(params[:id])
  @recipes = @chef.recipes.paginate(page: params[:page], per_page: per_page)
end

private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end
  
end