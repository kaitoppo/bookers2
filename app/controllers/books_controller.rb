class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @book_new.save
   #redirect_to book_path(@book.id)
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

   def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
   end
   
   def destroy
     @book = Book.find(params[:id])
     book.destroy
     redirect_to book_
   end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end