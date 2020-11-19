class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
     @user = current_user
     @users = User.all
     @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(user)
    else
     
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end