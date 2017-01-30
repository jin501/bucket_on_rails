Rails.application.routes.draw do
  devise_for :users
  root to: 'users#home'

  get '/buckets', to: 'buckets#all'
  get '/buckets/:id', to: 'buckets#index'
  get '/buckets/:id/:id', to: 'buckets#show'
  # get '/buckets/:username/:id/:goal', to: 'elements#index'


end
