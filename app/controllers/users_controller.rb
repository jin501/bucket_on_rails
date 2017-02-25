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



end
