Papersphere::Application.routes.draw do
  
  resources :reading_list_shares

  get 'remote_library/search'
  post 'remote_library/search'

  resources :group_members


  resources :reading_list_papers


  resources :groups


  resources :papers


  resources :reading_lists


  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root to: 'reading_lists#index'

end
