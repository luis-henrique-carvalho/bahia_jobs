FactoryBot.define do
  factory :experience do
    company_name { "MyString" }
    position { "MyString" }
    start_date { "2024-06-11" }
    end_date { "2024-06-11" }
    description { "MyText" }
    resume { nil }
  end
end
