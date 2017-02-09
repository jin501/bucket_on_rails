class BucketsController < ApplicationController

  #'/buckets'
  # index of all the buckets across users
  def all
    @buckets = Buket.order('created_at DESC')

    # @bucket = Buket.new
    # @bucket.goals.build
  end

  #'/buckets/:username'
  # index of buckets for a specific user
  def index
    @user = User.friendly.find(params[:username])
    @buckets = @user.bukets

    # hidden modal create form
    @bucket = Buket.new
    4.times {@bucket.goals.build}
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
    @bucket = Buket.new(bucket_params)

    if @bucket.save
      params[:hashtag].split(", ").each do |tag|
        @tag = Tag.find_or_create_by(tag: tag)
        @b_tag = BuketTag.create(buket_id: @bucket.id, tag_id: @tag.id)
      end
      redirect_to bucket_show_path(current_user, @bucket.id)
    else
      redirect_to bucket_index_path(current_user)
    end
  end

  #'/buckets/:username/:id'
  # show a specific bucket of a user / goals index
  def show
    @user = User.friendly.find(params[:username].downcase)
    @bucket = Buket.find(params[:bucket_id])
    # @bucket.goals.order('created_at DESC')
  end

  private

  def bucket_params
    params.require(:buket).permit(:title, :caption, :user_id, goals_attributes: [:title])
  end


end
