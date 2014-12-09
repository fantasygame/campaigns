class GamesController < ApplicationController
  expose(:campaign)
  expose(:games) { campaign.games }
  expose(:game, attributes: :game_params)
  before_filter :authenticate_user!

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
    game.save
    respond_with(campaign)
  end

  def update
    game.update(game_params)
    respond_with(game)
  end

  def destroy
    game.destroy
    respond_with(game)
  end

  private

    def game_params
      params.require(:game).permit(:name, :date)
    end
end
