class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    @game = Game.create!(game_params)
    if @game.save
      redirect_to root_path, notice: "Votre annonce à bien été créee."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def destroy
    @G = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :address, :price_per_day, :photo)
  end
end
