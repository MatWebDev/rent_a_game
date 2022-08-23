class BookingController < ApplicationController
  def new
    # @game = game.find(params[:game_id])
    # @booking = Booking.new
    # @user = current_user
  end

  def create

  end

  def destroy
    # @booking = Booking.find(params[:id])
    # @booking.destroy
  end

  private

  def booking_params
    # params.require(:booking).permit(:starting_date, :ending_date)
  end
end
