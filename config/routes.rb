Rails.application.routes.draw do
  devise_for :users
  root to: 'buckets#all'


  get '/buckets', to: 'buckets#all', as: 'bukets'
  get '/buckets/:id', to: 'buckets#index', as: 'bucket_index'
  get '/buckets/:id/new', to: 'buckets#new', as: 'new_bucket'
  post '/buckets', to: 'buckets#create'
  get '/buckets/:id/:id', to: 'buckets#show', as: 'bucket_show_path'
  # get '/buckets/:username/:id/:goal', to: 'elements#index'


end
