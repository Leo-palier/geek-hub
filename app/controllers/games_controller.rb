class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game_policy, only: %i[show edit update destroy buy]

  def index
    @games = policy_scope(Game).order(created_at: :desc)
    @user = current_user
  end

  def my_games
    @games = current_user.games
    authorize @games
  end

  def show
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to my_games_games_path
  end

  def buy
  end

  private

  def set_game_policy
    @game = policy_scope(Game).find(params[:id])
    authorize @game
  end

  def game_params
    params.require(:game).permit(:name, :year, :console, :price, :photo)
  end
end
