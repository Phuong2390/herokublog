Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'posts#index'
  get '/new', to: 'posts#new'
  get '/edit', to: 'posts#edit'
  
  resources :posts do
    resources :comments
  end

  get 'sessions/new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
