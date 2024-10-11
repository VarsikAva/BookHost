require 'httparty'



class BooksController < ApplicationController
  def index
    @books = Book.all
    # response = HTTParty.get('https://fakerapi.it/api/v1/books', query: {
    #   _locale: 'fr_FR',
    #   _quantity: 10
    # })

    # if response.success?
    #   @books = response.parsed_response['data']
    # else
    #   @error = "Impossible de récupérer les livres."
    # end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :price, :stock_quantity, :image_url, :seller_id)
  end
end
