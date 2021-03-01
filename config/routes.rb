Rails.application.routes.draw do
  root 'teams#index'
  devise_for :trainers
  resources :trainers
  resources :teams do
  	resources :pokemons
  end
end
