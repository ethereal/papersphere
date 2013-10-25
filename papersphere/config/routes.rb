Papersphere::Application.routes.draw do
  
  resources :reading_lists


  devise_for :users
  
  root to: 'home#index'

end
