require "rails_helper"

RSpec.describe User do
  subject(:user) { described_class.new(email: "user@example.com") }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to have_many(:games) }
  it { is_expected.to have_many(:campaigns) }
  it { is_expected.to have_many(:posts) }

  it "#email returns a string" do
    expect(user.email).to match "user@example.com"
  end

  it "#to_s return name" do
    user.name = "Uro"
    expect(user.to_s).to eq "Uro"
  end

  # describe "counts #points" do
  #   context "have 3 posts" do
  #     before do
  #       3.times do
  #         create(:post, user: user, game: build(:game))
  #       end
  #     end
  #     it "have 3 points" do
  #       expect(user.points).to eq 3
  #     end
  #   end
  # end
end
