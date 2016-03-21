Rails.application.routes.draw do
  
  root 'goals#index'

  resources :goals do
    resources :tasks
  end

end
