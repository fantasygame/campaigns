class HeroesController < ApplicationController
  expose(:campaign)
  expose(:heroes) { campaign.heroes }
  expose(:hero, attributes: :hero_params)

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    hero.campaign = campaign
    hero.user = current_user
    hero.save
    redirect_to campaign_heroes_path(campaign)
  end

  def hero_params
    params.require(:hero).permit(
      :name, :archetype, :race, :alignment, :deity, :titles, :appearance, :background, :mechanics
    )
  end
end
