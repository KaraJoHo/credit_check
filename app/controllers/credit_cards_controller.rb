class CreditCardsController < ApplicationController 
  def show 
    @credit_card = CreditCard.find(params[:id])
  end
end