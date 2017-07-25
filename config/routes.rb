Rails.application.routes.draw do
  # get 'reviews/index'

  # get 'reviews/new'

  # get 'reviews/create'

  # get 'reviews/show'

  # get 'reviews/destroy'

  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'users/destroy'

  # get 'ideas/index'

  # get 'ideas/new'

  # get 'ideas/create'

  # get 'ideas/show'
  
  get '/' => 'ideas#index'
  get('likes/:id', to: 'ideas#likes', as: :likes)
 
  resources :ideas do
    resources :reviews
  end 

  resources :users 
  
  post 'findit' => 'users#findit'
  delete '/reset' => 'users#resetuser'

  # get '/' => 'ideas#new' as: 'new' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
