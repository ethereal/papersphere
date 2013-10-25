Papersphere::Application.routes.draw do
  
  resources :reading_list_papers


  resources :groups


  resources :papers


  resources :reading_lists


  devise_for :users
  
  root to: 'reading_lists#index'

end
