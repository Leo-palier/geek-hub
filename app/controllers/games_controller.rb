class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]


    def index
        @games = Game.all
        games_filter = params[:games_filter]
        if games_filter.present?
        if games_filter[:search].present?
          @games = Game.search_by(games_filter[:search])
        end
        else
          @games = Game.all
        end
    end

    def my_games
        @games = current_user.games
    end

    def show
    	@game = Game.find(params[:id])
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
