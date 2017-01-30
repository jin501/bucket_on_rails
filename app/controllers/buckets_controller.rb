class BucketsController < ApplicationController

  #'/buckets'
  def all
    @buckets = Bucket.all
  end

  #'/buckets/:id'
  def index
    @user = User.friendly.find(params[:id])
    @buckets = @user.buckets
  end

  #'/buckets/:id/:id'
  def show
    
  end


end
