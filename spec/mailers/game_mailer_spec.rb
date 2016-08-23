require "rails_helper"

RSpec.describe GameMailer, type: :mailer do
  let(:member) { create(:user, name: "John Snow") }
  let(:campaign) { create(:campaign, users: [member], name: "Game of Thrones") }
  let(:game) { create(:game, campaign: campaign, name: "The Wall") }
  let(:not_member) { create(:user) }
  subject(:mailer) { described_class.notify_user(member, game) }

  xit "sends email to member" do
    expect(mailer).to deliver_to(member.email)
  end

  xit "has right subject" do
    expect(mailer).to have_subject("There is new game in #{campaign.name}")
  end

  xit "contains the user's name in the mail body" do
    expect(mailer).to have_body_text(/John Snow/)
  end

  xit "contains game name in mail body" do
    expect(mailer).to have_body_text(/The Wall/)
  end

  xit "contains campaign name in mail body" do
    expect(mailer).to have_body_text(/Game of Thrones/)
  end
end
