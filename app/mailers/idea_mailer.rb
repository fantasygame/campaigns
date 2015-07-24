class IdeaMailer < ApplicationMailer
  def notify_gamemaster(campaign, idea)
    @campaign = campaign
    @game_master = campaign.game_master
    @idea = idea
    mail(to: @game_master.email, subject: "There is new idea in #{@campaign.name} : #{@idea.title}")
  end
end
