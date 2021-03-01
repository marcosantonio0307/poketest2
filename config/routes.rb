Rails.application.routes.draw do
  devise_for :trainers
  root 'teams#index'
  resources :trainers
  resources :teams do
  	resources :pokemons
  end
end
