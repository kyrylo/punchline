FactoryGirl.define do
  factory :membership do
    artist
    association :member, factory: :rap_group_member
  end
end
