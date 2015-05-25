class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  expose(:items) { campaign.items }
  expose(:campaign)

  respond_to :html

  def sell
    item.sold_price = (item.price / 2)
    campaign.money = campaign.money + item.sold_price
    campaign.save
    item.sold = true
    item.hero_id = nil
    item.save
    redirect_to campaign_items_path(campaign)
  end

  def index
    respond_with(items)
  end

  def show
    respond_with(item)
  end

  def new
    respond_with(item)
  end

  def edit
  end

  def create
    item.save
    redirect_to campaign_items_path(campaign)
  end

  def update
    item.save
    redirect_to campaign_items_path(campaign)
  end

  def destroy
    item.destroy
    redirect_to campaign_items_path(campaign)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :sold, :campaign_id, :hero_id)
  end
end
