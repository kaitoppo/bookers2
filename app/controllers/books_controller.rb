class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(bokk_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
  
  def index
  end

  def show
  end

  def edit
  end
end
