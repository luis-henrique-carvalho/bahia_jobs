FactoryBot.define do
  factory(:company) do
    name { Faker::Company.name }
    # create a big text for summary
    summary { Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false) }
    founded_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    employee_count { Faker::Number.between(from: 1, to: 1000) }
    contact_email { Faker::Internet.email }
    contact_phone { Faker::PhoneNumber.cell_phone }
    url { Faker::Internet.url }

    association :user
  end
end
