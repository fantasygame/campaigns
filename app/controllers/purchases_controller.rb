class PurchasesController < ApplicationController
  expose(:purchase)

  def toggle_used
    authorize purchase
    purchase.used = !purchase.used
    if purchase.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
