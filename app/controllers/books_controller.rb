class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top]
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have creatad book successfully.'
      redirect_to book_path(@book)
    else
      render :index
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'You have destroyed book successfully.'
      redirect_to books_path
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
