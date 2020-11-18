class UsersController < ApplicationController




  def edit
    @user = User.find(params[:id])
  end


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
     @user = User.new
     @users = User.all
     @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end



  private

  def user_params
    params.require(:user).permit(:image, :body)
  end
end