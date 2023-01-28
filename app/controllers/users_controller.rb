class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    user_id = params[:id].to_i
  unless user_id == current_user.id
    redirect_to user_path(current_user.id)
  end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path,notice: 'You have updated user successfully.'
   else
      render :edit
   end
  end

  def index
    @users = User.all
    @book_new = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)

  end

end
