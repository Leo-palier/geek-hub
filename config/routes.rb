Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'
  resources :games do
  	resources :reviews, only: :create
  	collection do
  		get :my_profile, :my_games 
  	end
  	member do
  		get :buy
  	end
  end
end
