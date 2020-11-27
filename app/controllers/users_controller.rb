class UsersController < ApplicationController
  def show
    @user = policy_scope(User).find(params[:id])
    authorize @user
    @review = Review.new
  end
end
