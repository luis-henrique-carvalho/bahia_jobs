FactoryBot.define do
  factory :tag do
    name { Faker::Job.unique.field }
  end
end
