class BookingsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @booking = Booking.new
    @user = current_user
  end

  def create
    game = Game.find(params[:game_id])
    user = current_user
    starting_date = Date.parse(params[:booking][:starting_date])
    ending_date = Date.parse(params[:booking][:ending_date])
    rent_time = ending_date.mjd - starting_date.mjd
    total_price = game.price_per_day * rent_time
    @booking = Booking.new(game: game, user: user, total_price: total_price, starting_date: starting_date, ending_date: ending_date)
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end
end
