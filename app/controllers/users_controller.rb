class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @owned_books = @user.owned_books # Fetch the owned books
    @rented_books = @user.rented_books
  end
end
