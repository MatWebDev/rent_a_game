class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @games = Game.all
    # @games_count = @games.count
    # @dispo_count = 0
    @markers = @games.geocoded.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        info_window: render_to_string(partial: "info_window", locals: { game: game }),
        image_url: helpers.asset_url("markerok1.png"),
      }
    end
    if params[:query].present?
      sql_query = "games.name ILIKE :query OR \
      users.first_name ILIKE :query OR \
      games.address ILIKE :query"
      @games = Game.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.disponibility = true # à voir si on peut supprimer cette ligne
    @game.user = current_user
    if @game.save!
      redirect_to dashboard_path, notice: "Votre annonce a bien été créée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update(disponibility: true)
    redirect_to root_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :address, :price_per_day, :photo)
  end
end
