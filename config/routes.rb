Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post 'posts', to: 'posts#create'
  get  'posts', to: 'posts#new'
  post 'posts/:id/update', to: posts#edit"
  
  get 'posts/:id', to: 'posts#show'
  
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create]
  resources :posts, only: [:create, :edit, :update, :destroy]
end
