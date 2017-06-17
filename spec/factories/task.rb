FactoryGirl.define do
  factory :task do
    subject { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
