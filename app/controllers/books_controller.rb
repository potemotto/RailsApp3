class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    #@spbook = Book.find(params[:id])
    #@user = book.user.id

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = 'You have created book successfully.'
    else
      @books = Book.all
      #@current_user = current_user
      render :index
    end
  end

  def show
    @book = Book.new
    @current_user = current_user
    @spbook = Book.find(params[:id])
    @user = @spbook.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to  books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = 'You have updated book successfully.'
    else
      #@books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :book_image)
  end
end
