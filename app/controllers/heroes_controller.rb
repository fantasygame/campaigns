class HeroesController < ApplicationController
  expose(:campaign)
  expose(:heroes) { campaign.heroes }
  expose(:hero, attributes: :hero_params)

  def index
  end

  def new
  end

  def hero_params
    params.require(:game).permit(:name, :date)
  end
end
