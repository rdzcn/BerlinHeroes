Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'users/posts', to: 'posts#index', as: 'user_posts'

  root to: 'pages#home'

  resources :posts
end
