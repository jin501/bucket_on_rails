class BucketsController < ApplicationController

  #'/buckets'
  # index of all the buckets across users
  def all
    @buckets = Buket.all
  end

  #'/buckets/:username'
  # index of buckets for a specific user
  def index
    @user = User.friendly.find(params[:username])
    @buckets = @user.bukets
  end

  #'/buckets/:username/new'
  # create a new bucket
  def new
    @user = User.friendly.find(params[:username])
    if current_user == @user
      @bucket = Buket.new
      @bucket.goals.build
    else
      redirect_to buckets_index_path
    end
  end

  # post '/buckets/:id/new'
  def create
    @bucket = Buket.new(bucket_params)
    if @bucket.save
      redirect_to bucket_show_path(current_user, @bucket.id)
    else
      redirect_to new_bucket_path
    end
  end

  #'/buckets/:username/:id'
  # show a specific bucket of a user / goals index
  def show
    binding.pry
    @user = User.friendly.find(params[:username])
    @bucket = Bucket.find(params[:bucket_id])
  end

  private

  def bucket_params
    params.require(:buket).permit(:title, :caption, :user_id, goals_attributes: [:title], hashtags_attributes: [:hashtag])
  end


end
