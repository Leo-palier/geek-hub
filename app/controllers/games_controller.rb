class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]


    def index
        @games = Game.all
    end

    def my_games
        @games = current_user.games
    end

    def show
        @game = Game.find(params[:id])
        @transaction = Transaction.new
    end

    def new
    	@game = Game.new
    end

    def create
    	@game = Game.new(game_params)
        @game.user = current_user
    	if @game.save
    		redirect_to game_path(@game)
    	else
    		render :new
    	end
    end

    def edit
    	@game = Game.find(params[:id])
    end

    def update
    	  @game = Game.find(params[:id])
    @game.update(game_params)
    
    redirect_to game_path(@game)
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to my_games_games_path
    end

    def buy
        @game = Game.find(params[:id])
    end

    private

    def game_params
  params.require(:game).permit(:name, :year, :console, :price, :photo)
end
end
