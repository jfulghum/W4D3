class SessionsController < ApplicationController
  # before_action :not_logged_in?

  def new
    if not_logged_in?
      @user = User.new
      render :new
    else
      flash[:errors] = ['You\'re already logged in!']
    end
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user
      login(user)
      redirect_to cats_url
    else
      flash.now[:errors] = ['Invalid user/password combination']
      @user = User.new
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to :cats_url
  end

end
