class ReviewsController < ApplicationController
  def create
    @user = policy_scope(User).find(params[:user_id])
    authorize @user
    @review = Review.new(review_params)
    @review.user = @user
    @review.creator = current_user
    if @review.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
