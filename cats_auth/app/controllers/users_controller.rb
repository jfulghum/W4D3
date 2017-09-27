class UsersController < ApplicationController

  def new

    @user = User.new
    render :new
  end

  def create

    @user = User.new(user_params)
    # debugger
    if @user.save
      redirect_to cats_url
      login(@user)
    else
      flash.now[:errors] = ['Invalid username/password combination']
      render :new
    end

  end

  def destroy
    logout
    redirect_to cats_url
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
