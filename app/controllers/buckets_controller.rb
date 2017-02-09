class BucketsController < ApplicationController
  # include ApplicationHelper

  #'/buckets'
  # index of all the buckets across users
  def all
    @buckets = Buket.all

    @bucket = Buket.new
    @bucket.goals.build
  end

  #'/buckets/:username'
  # index of buckets for a specific user
  def index
    @user = User.friendly.find(params[:username])
    @buckets = @user.bukets

    @bucket = Buket.new
    @bucket.goals.build
    # binding.pry
  end

  #'/buckets/:username/new'
  # create a new bucket
  def new
    render :plain => "hi", layout: false
    # @user = User.friendly.find(params[:username])
    # if current_user == @user
    #   @bucket = Buket.new
    #   3.times {@bucket.goals.build}
    # else
    #   redirect_to buckets_index_path
    # end
  end



  # post '/buckets/:id/new'
  def create
    binding.pry
    @bucket = Buket.new(bucket_params)

    if @bucket.save
      # params[:hashtag].split(", ").each do |tag|
        # @hashtag = Hashtag.find_or_create_by(hashtag: tag)
        # @b_tag = Bucket_hashtag.create(bucket_id: @bucket.id, hashtag_id: @hashtag.id)
        # binding.pry
      # end
      redirect_to bucket_show_path(current_user, @bucket.id)
    else
      redirect_to new_bucket_path
    end
  end

  #'/buckets/:username/:id'
  # show a specific bucket of a user / goals index
  def show
    @user = User.friendly.find(params[:username].downcase)
    @bucket = Buket.find(params[:bucket_id])

  end

  private

  def bucket_params
    params.require(:buket).permit(:title, :caption, :user_id, goals_attributes: [:title])
  end


end
