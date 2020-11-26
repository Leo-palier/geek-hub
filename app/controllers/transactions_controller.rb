class TransactionsController < ApplicationController
  def create
    @transaction = Game.find(params[:id])
    @transaction = Transaction.new
    @transaction.user = current_user
    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render :new
    end
  end
end
