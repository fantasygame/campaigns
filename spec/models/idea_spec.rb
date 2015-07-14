require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:campaign) }
  it { is_expected.to validate_presence_of(:user) }
end
