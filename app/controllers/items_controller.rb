class ItemsController < ApplicationController
  expose(:item, attributes: :item_params)
  expose(:items) { campaign.items.paginate(page: params[:page], per_page: 15) }
  expose(:campaign)

  respond_to :html

  def sell
    authorize item
    SellItem.new(item, campaign).call
    redirect_to campaign_items_path(campaign)
  end

  def reclaim
    authorize item
    ReclaimItem.new(item, campaign).call
    redirect_to campaign_items_path(campaign)
  end

  def index
    respond_with(items)
  end

  def show
    respond_with(item)
  end

  def new
    authorize item
    respond_with(item)
  end

  def edit
    authorize item
  end

  def create
    authorize item
    item.save
    redirect_to campaign_items_path(campaign)
  end

  def update
    authorize item
    item.save
    redirect_to campaign_items_path(campaign)
  end

  def destroy
    authorize item
    item.destroy
    redirect_to campaign_items_path(campaign)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :sold, :campaign_id, :hero_id, :description, :sold_price)
  end
end
