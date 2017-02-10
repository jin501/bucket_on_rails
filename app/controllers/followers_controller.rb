class FollowersController < ApplicationController
  def follow_user
    @user = User.find_by(username: params[:username])
    @follow = Follow.new(follower_id: current_user.id, following_id: @user.id)
    if @follow.save
      respond_to do |format|
        format.html {render :unfollow_user, layout: false}
      end
    end
  end

  def unfollow_user
    @user = User.find_by(username: params[:username])
    @follow = Follow.find_by(follower_id: current_user.id, following_id: @user.id)
    if @follow.destroy
      binding.pry
      respond_to do |format|
        format.html {render :follow_user, layout: false}
      end
    end
  end
end
