require "rails_helper"

RSpec.describe Vote, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :post }
  it { is_expected.to respond_to :author }
end
