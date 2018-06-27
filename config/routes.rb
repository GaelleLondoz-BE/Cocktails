Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end
  resources :doses, only:[:destroy]
  resources :cocktails, only:[:destroy]

  get "cocktails/:id/reviews", to: "cocktails#show"
end
