class BookingsController < ApplicationController
    before_action :set_book, only: [:new, :create]

    def index
      @bookings = Booking.where(user: current_user)
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = current_user.bookings.build(booking_params)
      @booking.book = @book

      if @booking.save
        redirect_to @booking, notice: 'Booking was successfully created.'
      else
        redirect_to @book, alert: 'This book is currently out of stock.'
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
