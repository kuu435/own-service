Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post 'posts', to: 'posts#create'
  get  'posts', to: 'posts#new'
  
  
  get 'posts/:id', to: 'posts#show'
  
  get 'signup', to: 'users#new' 
    resources :users, only: [:index, :show, :new, :create]do
     member do
        get :favorites
      end
    end
    
  get 'search', to: 'posts#search'
  
  resources :posts, only: [:create, :edit, :update, :destroy] do
  resource :comments, only: [:create, :destroy]
  end 
  
  
  resources :posts, only: [:create, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
 end
