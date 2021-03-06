class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game_policy, except: :my_profile
  before_action :set_game_policy, only: %i[show edit update destroy buy]

  def index
    @games = policy_scope(Game).order(created_at: :desc)
    @user = current_user
    if params[:games_filter].present?
      @games = Game.search_by(params[:games_filter][:search])
    else
      @games = Game.all
    end
  end

  def show
    @transaction = Transaction.new
  end

  def my_games
    @games = current_user.games
    authorize @games
  end

  def my_profile
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
    params.require(:game).permit(:name, :description, :console, :price, :photo)
  end
end
