class MoneyHistoryController < ApplicationController
  expose(:money_histories) { campaign.money_histories }
  expose(:campaign)

  def index
  end
end
