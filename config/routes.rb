Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'buckets#all'
  get '/home', to: 'users#home'
  get '/buckets', to: 'buckets#all', as: 'bukets'
  get '/buckets/:username', to: 'buckets#index', as: 'buket'
  get '/buckets/:username/new', to: 'buckets#new', as: 'new_bucket'
  post '/buckets', to: 'buckets#create'
  get '/buckets/:username/:bucket_id', to: 'buckets#show', as: 'bucket_show'
  get '/buckets/:username/:bucket_id/:goal', to: 'goals#show', as: 'goals_show'

  get '/goals/new', to: 'goals#new'
  get '/users/:username/edit', to: 'users#edit'
  # get '/buckets/:username/:bucket_id/:goal/edit'

  # FollowersController
  # get 'followers/follow_user'
  # get 'followers/unfollow_user'
  post ':username/follow_user', to: 'followers#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'followers#unfollow_user', as: :unfollow_user

end
