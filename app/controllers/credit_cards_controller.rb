class CreditCardsController < ApplicationController 
  def show 
    @credit_card = CreditCard.find(params[:id])

    # if @credit_card 
    #   @credit_card
    # else 
    #   flash[:error] = @credit_card.errors.full_messages.to_sentence
    # end
  end
end