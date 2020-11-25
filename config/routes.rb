Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'
  resources :games do
  	collection do
  		get :my_games
  	end
  end
end
