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

  def top

  end
  def about
  end
  def show
    @books = Book.all
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
