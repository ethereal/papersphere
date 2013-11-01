Papersphere::Application.routes.draw do
  
  resources :reading_list_shares

  get 'remote_library/search'
  post 'remote_library/search'

  resources :group_members


  resources :reading_list_papers
  match '/remove_paper_from_list' => 'reading_list_papers#remove_paper_from_list', :as => 'remove_paper_from_list'


  resources :groups


  resources :papers


  resources :reading_lists, :except => [ :new, :edit ]


  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root to: 'reading_lists#index'

end
