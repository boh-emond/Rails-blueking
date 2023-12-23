class BookingsController < ApplicationController
  before_action :find_room, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
    @user_bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = @room.bookings.new(booking_params)
    @booking.room = @room
    @booking.user = current_user

    @booking.total_price = (@booking.ends_at - @booking.starts_at) * @room.price_per_night
    if @booking.save
      flash[:notice] = 'la réservation a été effectuée avec succès.'
      redirect_to room_booking_path(@room, @booking), notice: "Réservation effectuée"
    else
      flash[:alert] = "la réservation n'a pas pu être effectuée"
      render 'rooms/show'
    end
  end

  private

  def find_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :user_id)
  end
end
