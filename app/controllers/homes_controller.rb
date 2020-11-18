class HomesController < ApplicationController
  def top
  end
  
  def show
    @user = User.find(params[:id])  
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end
end
