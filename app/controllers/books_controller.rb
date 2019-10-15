class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top]
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  def show
    @book = Book.find(id:params[:id])
  end
  def top

  end
  def about
  end
  def show
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
