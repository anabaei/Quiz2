FactoryGirl.define do
  factory :idea do
    title { Faker::Name.title}
    des { Faker::Coffee.notes }
  end
end




