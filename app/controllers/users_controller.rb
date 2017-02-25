class UsersController < ApplicationController
  layout 'application', :except => :home

# '/'
  def home

  end

  def edit
    @user = User.friendly.find(params[:username])
    if current_user != @user
      redirect_to '/'
    end
  end

  def update
    @user = User.friendly.find(params[:username])
    @user.bio = params[:user][:bio]
    @user.save
    redirect_to `/buckets/#{@user}`
    binding.pry
  end

end
