require 'rails_helper'

RSpec.describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to have_many(:games) }
  it { is_expected.to have_many(:campaigns) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "#to_s return name" do
  	@user.name = 'Uro'
  	expect(@user.to_s).to eq 'Uro'
  end

end
