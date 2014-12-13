class GamesController < ApplicationController
  expose(:campaign)
  expose(:games) { campaign.games }
  expose(:game, attributes: :game_params)
  before_action :authenticate_user!, except: :show

  respond_to :html, :json, :xml

  def show
    authorize game
    respond_with(game)
  end

  def new
    authorize game
    respond_with(game)
  end

  def edit
  end

  def create
    authorize game
    game.save
    NotifyMembers.new(game).call
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
    params.require(:game).permit(:name, :date)
  end
end
