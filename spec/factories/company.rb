FactoryBot.define do
  factory(:company) do
    name { Faker::Company }
    url { Faker::Internet.url }

    association :user
  end
end
