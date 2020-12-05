class UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only:[:edit, :update]


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
  end


  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end

  def followings
      @user  = User.find(params[:id])
      @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
  
  def search
    @user_or_book = params[:option]
    @how_search = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
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
    params.require(:user).permit(:name, :profile_image, :introduction, :follower, :followers)
  end
end