# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    delete 'logout', to: 'users/sessions#destroy'
  end
  
  resources :posts, only: [:index, :show] do
    resources :comments
  end

  resources :users, only: [:index, :show]
end
