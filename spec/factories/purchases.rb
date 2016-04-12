FactoryGirl.define do
  factory :purchase do
    reward nil
    campaign nil
    user nil
    name "MyString"
    cost 1
    used false
  end
end
