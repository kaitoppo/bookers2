class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    redirect_to book_path(@book_new.id),notice: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book_new = Book.new
    @user = @book_new.user
  end

  def show
    @books = Book.find(params[:id])
    @book_new = Book.new
    @user = @books.user
  end

  def edit
     @book = Book.find(params[:id])
     redirect_to books_path unless current_user.id == @book.user_id
  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path,notice: 'You have updated book successfully.'
    else
      render :edit
    end
   end

   def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
   end

private

def book_params
  params.require(:book).permit(:title, :body)
end
end