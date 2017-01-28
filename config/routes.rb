Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :goals
  root to: 'users#home'
  #
  # get '/buckets', to: 'buckets#index'
  # get '/buckets/:username', to: 'buckets#show'
  # get '/buckets/:username/:id', to: 'buckets#'
  #

end
