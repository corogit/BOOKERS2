class UsersController < ApplicationController
before_action :authenticate_user! 
before_action :ensure_correct_user, only:[:edit, :update]
  

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
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end

  private
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
     redirect_to user_path(current_user)
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end