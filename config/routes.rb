Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  get 'home/index'
  root to: "home#index"
  resources :books
  resources :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
