# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :posts, only: [:index, :show] do
    resources :comments
  end

  resources :users, only: [:index, :show]
end
