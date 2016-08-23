class GamesController < ApplicationController
  expose(:campaign)
  expose(:games) { campaign.games }
  expose(:game)
  before_action :authenticate_user!, except: :show
  expose(:heroes) { game.heroes }

  respond_to :html, :json, :xml

  def show
    authorize game
    respond_with(game)
  end

  def new
    game.campaign = campaign
    authorize game
    respond_with(game)
  end

  def edit
  end

  def create
    game = Game.new(game_params)
    game.campaign = campaign
    authorize game
    game.save
    NotifyMembers.new(game, current_user).call
    respond_with(campaign)
  end

  def update
    authorize game
    game.update(game_params)
    respond_with(campaign, game)
  end

  def destroy
    authorize game
    game.destroy
    respond_with(campaign)
  end

  private

  def game_params
    params.require(:game).permit(:name, :date, hero_ids: [])
  end
end
