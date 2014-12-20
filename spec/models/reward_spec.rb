require 'rails_helper'

RSpec.describe Reward, type: :model do
  it { is_expected.to have_many(:purchases) }
  it { is_expected.to belong_to(:campaign) }
end
