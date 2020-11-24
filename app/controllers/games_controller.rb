class GamesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

    def index
        @games = Games.all
    end
end
