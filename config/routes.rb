Rails.application.routes.draw do
  post 'login' => 'auth#login'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/self', to: 'users#show'
  put 'users/self', to: 'users#update'
  delete 'users/self', to: 'users#destroy'

  get 'articles', to: 'articles#index'
  post 'articles', to: 'articles#create'
  get 'articles/:id', to: 'articles#show'
  put 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'

  get 'posts', to: 'posts#index'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#show'
  put 'posts/:id', to: 'posts#update'
  get 'posts/:id', to: 'posts#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
