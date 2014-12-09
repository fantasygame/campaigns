class GamesController < ApplicationController
  expose(:campaign)
  expose(:games) { campaign.games }
  expose(:game, attributes: :game_params)

  respond_to :html, :json, :xml

  def show
    respond_with(game)
  end

  def new
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
