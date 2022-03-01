Rails.application.routes.draw do
  namespace :users do
    get 'followings/index'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  post 'follows/:id' => 'follows#create', as: :follow
  delete 'follows/:id' => 'follows#destroy', as: :unfollow
end
