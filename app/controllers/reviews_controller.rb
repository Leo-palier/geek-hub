class ReviewsController < ApplicationController
  def create
    @user = policy_scope(User).find(params[:user_id])
    authorize @user
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
