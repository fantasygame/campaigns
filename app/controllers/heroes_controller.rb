class HeroesController < ApplicationController
  expose(:campaign)
  expose(:heroes) { campaign.heroes }
  expose(:heroes, attributes: :hero_params)

  def index
  end

  def hero_params
    params.require(:game).permit(:name, :date)
  end
end
