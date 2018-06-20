class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update]
  # before_action :booking_params, only: [:create, :update]

  def new
    @booking = Booking.new
    @nr_traveller = 1
    @types = Type.all

    @user = current_user
  end

  def create
    # update params for create when form exists
    # creating a new booking
    # add all params for booking

    @booking = Booking.new(booking_params)
    # loop through number of travellers from bookings param and add new traveller
    # @booking.new_traveller
    @booking.user = current_user
    @booking.save

    redirect_to booking_path(@booking)
  end

  def edit
  end

  def update
    # update params for update when form exists
    @booking.update(user: @current_user )
    redirect_to booking_path(@booking)
  end

  def show
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # set params for booking

  def booking_params
    params.require(:booking).permit(:origin, :number_traveller)
  end

end
