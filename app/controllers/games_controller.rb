class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

    def index
        @games = Game.all
    end

    def show
    	@game = Game.find(params[:id])
    end

    def new
    	@game = Game.new
    end

    def create
    	@game = Game.new(game_params)
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

    private

    def game_params
  params.require(:game).permit(:name, :year, :console, :price, :photo)
end
end
