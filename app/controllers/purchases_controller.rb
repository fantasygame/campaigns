class PurchasesController < ApplicationController
  expose(:purchase)

  def toggle_used
    authorize purchase
    purchase.used = !purchase.used
    purchase.save
    redirect_to :back
  end
end
