class ReviewsController < ApplicationController

	 def show
    @game.user = Game.find(params[:id])
    @review = Review.new  # <-- You need this now.
  end

	 def create
    @game.user = Game.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to my_games_games_path
    else
      render my_games_games_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
