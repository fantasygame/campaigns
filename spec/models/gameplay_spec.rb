require 'rails_helper'

RSpec.describe Gameplay, :type => :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:user) }
end
