require 'rails_helper'

RSpec.describe Response::Success, type: :class do
  subject(:success) { described_class.new(message: 'success') }

  it "is #success" do
    expect(success.success?).to be_truthy
  end

  it "is not a #error" do
    expect(success.error?).to be_falsey
  end

  it "creates #flash" do
    flash = { notice: 'success' }
    expect(success.flash).to eq flash
  end
end
