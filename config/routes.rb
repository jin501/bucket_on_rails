Rails.application.routes.draw do
  devise_for :users
  root to: 'buckets#all'


  get '/buckets', to: 'buckets#all', as: 'bukets'
  get '/buckets/:username', to: 'buckets#index', as: 'bucket_index'
  get '/buckets/:username/new', to: 'buckets#new', as: 'new_bucket'
  post '/buckets', to: 'buckets#create'
  get '/buckets/:username/:bucket_id', to: 'buckets#show', as: 'bucket_show'
  get '/buckets/:username/:bucket_id/:goal', to: 'goals#show', as: 'goals_show'
  # get '/buckets/:username/:bucket_id/:goal/edit'

end
