class HeroesController < ApplicationController
  expose(:campaign)
  expose(:heroes) { campaign.heroes }
  expose(:hero, attributes: :hero_params)
  before_action :authenticate_user!, except: [:show, :index]

  def change_money
    authorize hero
    change = params[:hero][:money_change].to_i
    ChangeMoney.new(current_user, hero, change).call
    redirect_to campaign_hero_path(campaign, hero), notice: 'Money has been changed'
  end

  def index
  end

  def new
    hero.campaign = campaign
    authorize hero
  end

  def edit
    authorize hero
  end

  def show
  end

  def create
    hero.campaign = campaign
    hero.user = current_user
    authorize hero
    hero.save
    redirect_to campaign_heroes_path(campaign)
  end

  def update
    authorize hero
    hero.update(hero_params)
    redirect_to campaign_hero_path(campaign, hero)
  end

  def destroy
    authorize hero
    hero.destroy
    redirect_to campaign_heroes_path(campaign)
  end

  def hero_params
    params.require(:hero).permit(
      :name, :archetype, :race, :alignment, :deity, :titles, :appearance, :background, :mechanics, :image, :user_character
    )
  end
end
