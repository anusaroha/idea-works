class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "You've now signed up !"
    else
      flash[:alert] = "Article not created!"
      render :new
    end
  end

  def edit
  end

  def show
    redirect_to root_path
  end

  def update
  if @user.update user_params
    redirect_to user_path(@user), notice: "Profile updated successfully."
  else
    flash[:notice] = "Profile not updated."
    render :edit
  end
  end

  def change_password

  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find current_user.id
    end



  end
