require 'rails_helper'

RSpec.describe Game, :type => :model do
  
	it { is_expected.to belong_to(:campaign) }
	it { is_expected.to have_many(:users) }
	it { is_expected.to validate_presence_of(:campaign) }
	it { is_expected.to validate_presence_of(:name) }

end
