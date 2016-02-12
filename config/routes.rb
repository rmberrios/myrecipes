Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'

  ### Recipes routes
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  post '/recipes', to: 'recipes#create'
  get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  patch '/recipes/:id', to: 'recipes#update'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  post '/recipes/:id/like', to: 'recipes#like', as: 'like_recipe'
  
  
  # delete '/recipes/:id', to: 'recipes#destroy'
  
  ## all the code above can be compress into 
  # resources :recipes do
  #   member do
  #     post 'like'
  #   end
  # end
  
  ### Chef Routes
  
  resources :chefs, except: [:new]
  
  get '/register', to: 'chefs#new'
  
  
end
