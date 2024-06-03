FactoryBot.define do
  factory :position do
    name { Faker::Job.unique.title }
    career { Position.careers.keys.sample }
    city { Faker::Address.city }
    contract { Position.contracts.keys.sample }
    description { Faker::Lorem.paragraph }
    publish { [true, false].sample }
    remote { [true, false].sample }
    state { Faker::Address.state_abbr }
    summary { Faker::Lorem.sentence }

    association :company

    trait :with_tags do
      transient do
        tags_count { 3 }
      end

      after(:create) do |position, evaluator|
        create_list(:tag, evaluator.tags_count, positions: [position])
      end
    end
  end
end
