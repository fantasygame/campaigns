require 'rails_helper'

RSpec.describe Response::Error, type: :class do

  subject(:error) { Response::Error.new(message: 'error') }

  it "is not a #success" do
    expect(error.success?).to be_falsey
  end

  it "is #error" do
    expect(error.error?).to be_truthy
  end

  it "creates #flash" do
    flash = { alert: 'error' }
    expect(error.flash).to eq flash
  end

end