class BucketsController < ApplicationController

  #'/buckets'
  def all
    @buckets = Buket.all
  end

  #'/buckets/:id'
  def index
    @user = User.friendly.find(params[:id])
    @buckets = @user.bukets
  end

  #'/buckets/:id/new'
  def new
    @user = User.friendly.find(params[:id])
    if current_user == @user
      @bucket = Buket.new
      @bucket.goals.build
    else
      redirect_to buckets_path
    end
  end

  #'/buckets/:id/:id'
  def show

  end

  # post '/buckets/:id/new'
  def create
    @bucket = Buket.new(bucket_params)
    if @bucket.save
      redirect_to bucket_index_path(current_user)
    else
      redirect_to new_bucket_path
    end
  end

  private

  def bucket_params
    params.require(:buket).permit(:title, :caption, :user_id, goals_attributes: [:title], hashtags_attributes: [:hashtag])
  end


end
