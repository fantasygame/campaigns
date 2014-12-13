FactoryGirl.define do
  factory :campaign do
    name "Campaign Name"
    description "Campaign Description"
    association :game_master, factory: :user
  end
end
