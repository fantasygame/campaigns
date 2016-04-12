class JoinMailer < ApplicationMailer
  def join_request(user, campaign)
    @game_master = campaign.game_master
    @user = user
    @campaign = campaign
    mail(
      to: @game_master.email,
      subject: "There is new request from #{@user.name} to join #{@campaign.name} campaign."
    )
  end
end
