require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  
	subject(:campaign) { build(:campaign) }

	it { is_expected.to belong_to(:game_master) }
	it { is_expected.to validate_presence_of :name }

end
