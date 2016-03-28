Rails.application.routes.draw do
  
  devise_for :users

  get '/users', to: 'users#show'

  root 'site#index'

  patch '/:id/archive', to: 'goals#archive'

  resources :goals do
    resources :tasks
  end

end
